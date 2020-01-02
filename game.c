#include <stdlib.h>
#include "game.h"
#include <stdio.h>
#include "myLib.h"
#include "gameBack.h"
#include "startScreen.h"
#include "pauseScreen.h"
#include "gameOver.h"
#include "winScreen.h"
#include "spriteSheet.h"
#include "collisionMap.h"
#include "sound.h"
#include "Slap-SoundMaster13-49669815.h"
#include "MarioPowerup.h"

ANISPRITE player;
ANISPRITE vegetables[VEGETABLECOUNT];
ANISPRITE healthBar;
ANISPRITE pizzaBar;

int livesRemaining = 4;
int inTheDumpster = 0;
int cheatOn = 0;
int pizzaAchieved = 0;

int screenBlock;


// animation states for player
enum {PLAYERFRONT, PLAYERBACK, PLAYERRIGHT, PLAYERLEFT, PLAYERIDLE};

int vOff = 0;
int hOff = 0;
int collisionAdjustment = 0;

int randVeggieIndex  = 0;
int randPizzaIndex = 0;
int frameCount = 0;
int jumpCount = 0;

#define GRAVITY   100
#define JUMPPOWER 1500

//----------------------------------------------------------------------------------
// GAME FUNCTIONS

void initGame() {

    vOff = 20;
    hOff = 20;
    screenBlock = 28;

    // load palette and tiles for spritesheet
    DMANow(3, spriteSheetPal, SPRITEPALETTE, 256);
    DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);

    initPlayer();
    initVeggies();
    initHealth();
    initPizzaBar();
}

void drawGame() {
    // // do the opposite for less than 0
    if (hOff > 256) {
        screenBlock++;
        hOff -= 256;
        // player.worldCol -= 256;
        for (int i = 0; i < VEGETABLECOUNT; i++) {
            vegetables[i].worldCol -= 256;
        }
        // collisionAdjustment += 256;
        REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(screenBlock) | BG_SIZE_WIDE;
    }

    // ATTEMPT AT LEFT MOVEMENT
    if (hOff < 0) {
        screenBlock--;
        hOff += 256;
        // player.worldCol += 256;
        for (int i = 0; i < VEGETABLECOUNT; i++) {
            vegetables[i].worldCol += 256;
        }
        // collisionAdjustment -= 256;
        REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(screenBlock) | BG_SIZE_WIDE;
    }

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    drawPlayer();

    drawHealthorPizza(&healthBar);

    drawHealthorPizza(&pizzaBar);

    for (int i = 0; i < VEGETABLECOUNT; i++) {
        drawVeggie(&vegetables[i]);
    }

}

void updateGame() {

    updatePlayer();

    for (int i = 0; i < VEGETABLECOUNT; i++) {
        updateVeggie(&vegetables[i], &healthBar, &pizzaBar);
    }

    frameCount++;

    if (frameCount == 50) {
        frameCount = 0;
        randVeggieIndex = rand() % VEGETABLECOUNT;
        if (!vegetables[randVeggieIndex].active) {
            fireVeggie(&vegetables[randVeggieIndex]);
        }
    }
}

//----------------------------------------------------------------------------------
// PLAYER FUNCTIONS

void initPlayer() {
    // player.rdel = 2;
    player.cdel = 1;
    player.width = 32;
    player.height = 32;
    player.rdel = 0;
    player.worldRow = SHIFTUP(SCREENHEIGHT/2-player.width/2 + vOff);
    player.worldCol = SCREENWIDTH/2-player.height/2 + hOff;
    player.aniState = 0; // starts as top left
    player.currFrame = 0; // starts as top left
    player.active = 1;
    player.numFrames = 3;
    player.aniCounter = 0;
    player.phOff=20;
}

void drawPlayer() {
    shadowOAM[0].attr0 = (ROWMASK & player.screenRow) | ATTR0_SQUARE | ATTR0_4BPP;
    shadowOAM[0].attr1 = (COLMASK & player.screenCol) | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_TILEID(player.aniState * 4, player.currFrame * 4) | ATTR2_PALROW(0);
}

void updatePlayer() {

    // change to umbrella mode if cheat is on
    if (cheatOn) {
        player.aniState = 1;
    } else {
        player.aniState = 2;
    }

    // did the raccoon jump into the dumpster?
    if (pizzaAchieved && player.worldCol + collisionAdjustment >= MAPWIDTH - 100) {
        inTheDumpster = 1; 
        vOff = 20;
        hOff = 20;
        collisionAdjustment = 0;
        player.height = 32;
        player.worldRow = SHIFTUP(SCREENHEIGHT/2-player.width/2 + vOff);
        player.worldCol = SCREENWIDTH/2-player.height/2 + hOff;
        
    }

    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (player.worldCol > 0 &&
            player.screenCol > 0 &&
            collisionMapBitmap[OFFSET(player.worldCol - 2, SHIFTDOWN(player.worldRow), MAPWIDTH)] &&
            collisionMapBitmap[OFFSET(player.worldCol - 2, SHIFTDOWN(player.worldRow) + player.height - 1, MAPWIDTH)]) {

            // Update player's world position if the above is true
            player.worldCol -= player.cdel;


            if (screenBlock >= 28
                // && hOff > 0 remove so that hOff can be negative
                && player.screenCol < SCREENWIDTH / 2) {

                // Update background offset variable if the above is true
                 hOff--;
                 player.phOff--;

           }
       }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (player.worldCol + player.width + collisionAdjustment< MAPWIDTH &&
            collisionMapBitmap[OFFSET(player.worldCol + player.width + 1 + collisionAdjustment, SHIFTDOWN(player.worldRow), MAPWIDTH)] &&
            collisionMapBitmap[OFFSET(player.worldCol + player.width + 1 + collisionAdjustment, SHIFTDOWN(player.worldRow) + player.height - 1, MAPWIDTH)]) {

            // Update player's world position if the above is true
            player.worldCol += player.cdel;


            if (screenBlock < 31 && hOff < (MAPWIDTH - SCREENWIDTH) && player.screenCol > SCREENWIDTH / 2) {

                // Update background offset variable if the above is true
                hOff++;
                player.phOff++;

            }
        }
    }



    if(SHIFTDOWN(player.worldRow+player.rdel + collisionAdjustment)+player.height-1<MAPHEIGHT-1
		&& collisionMapBitmap[OFFSET(player.worldCol + collisionAdjustment, SHIFTDOWN(player.worldRow + player.rdel) + player.height-1, MAPWIDTH)]
		&& collisionMapBitmap[OFFSET(player.worldCol + player.width + collisionAdjustment, SHIFTDOWN(player.worldRow + player.rdel) + player.height-1, MAPWIDTH)])
		{
		//tells to move player down until it could collide with the bottom of the screenRow
		player.worldRow += player.rdel;

	} else { //if it is on the bottom of the screen, rdel is 0

		player.rdel = 0;
	}

    if (vOff < MAPHEIGHT - SCREENHEIGHT && player.screenRow > SCREENHEIGHT / 2) {

        // Update background offset variable if the above is true
        vOff++;
    }

    // make sure player can't jump too many times in a row
    jumpCount++;

    if(BUTTON_PRESSED(BUTTON_A) && jumpCount > 50){
		player.rdel -= JUMPPOWER;
        jumpCount = 0;
	}

	player.rdel += GRAVITY;

    player.screenRow = SHIFTDOWN(player.worldRow) - vOff;
    player.screenCol = player.worldCol - player.phOff; //modified to use separate hOff

    animatePlayer();

}

void animatePlayer() {
    // Set previous state to current state
    player.prevAniState = player.aniState;
    // change to idle
    player.aniState = PLAYERIDLE;

    // Change the animation frame every 20 frames of gameplay
    if(player.aniCounter % 20 == 0) {
        player.currFrame = (player.currFrame + 1) % player.numFrames;
    }

    // Control movement and change animation state

    if (BUTTON_HELD(BUTTON_LEFT) && !cheatOn)
        player.aniState = PLAYERLEFT;
    if (BUTTON_HELD(BUTTON_LEFT) && cheatOn)
        player.aniState = 7;
    if (BUTTON_HELD(BUTTON_RIGHT) && cheatOn)
        player.aniState = 1;
    if (BUTTON_HELD(BUTTON_RIGHT) && !cheatOn)
         player.aniState = PLAYERRIGHT;
    if (player.aniState == PLAYERIDLE) {
        player.currFrame = 0;
        player.aniCounter = 0;
        player.aniState = player.prevAniState;
        player.aniCounter++;
    } else {
        player.aniCounter++;
    }
}

//----------------------------------------------------------------------------------
// VEGGIES FUNCTIONS

void initVeggies() {
    for (int i = 0; i < VEGETABLECOUNT; i++) {
        vegetables[i].height = 16;
        vegetables[i].width = 16;
        vegetables[i].rdel = 1;
        vegetables[i].cdel = 0;
        vegetables[i].aniState = 8;
        vegetables[i].currFrame = 0;
        vegetables[i].active = 0;
        vegetables[i].numFrames = 5;
        vegetables[i].index = i + 50;
        vegetables[i].phOff=20;
    }
}

void fireVeggie(ANISPRITE* v) {
    int randColIndex = rand() % SCREENWIDTH;
    v->worldCol=randColIndex;
    v->worldRow = 10;
    v->active = 1;
     if (randPizzaIndex == 0) {
        v->currFrame = 4;
        randPizzaIndex = 1;
    } else {
        int randCurrFrame = (rand() % v->numFrames);
        v->currFrame = randCurrFrame;
        randPizzaIndex = 0;
    }
    
}

void drawVeggie(ANISPRITE* v) {
    if (v->active) {
        shadowOAM[v->index].attr0 = (ROWMASK & v->screenRow) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[v->index].attr1 = (COLMASK & v->screenCol) | ATTR1_SMALL;
        shadowOAM[v->index].attr2 = ATTR2_TILEID((v->aniState) * 2, (v->currFrame) * 2) | ATTR2_PALROW(0);
    } else {
        shadowOAM[v->index].attr0 = ATTR0_HIDE;
    }
}

void updateVeggie(ANISPRITE* v, ANISPRITE* h, ANISPRITE* p) {
     if (v->active) {
        v->worldRow += v->rdel;

        if ((v->worldRow) >= MAPHEIGHT) {
            v->active = 0;
        }

        // if collision with player, decrement health
        // adding in cheat

        if ((!cheatOn || v->currFrame == 4) && v->active && collision(v->screenCol, v->screenRow, v->width, v->height,
            player.screenCol, player.screenRow, player.width, player.height)) {

            // case where it is a vegetable
            if (v->currFrame < 4) {
                // play slap sound upon collision
                playSoundB(Slap_SoundMaster13_49669815, SLAP_SOUNDMASTER13_49669815LEN,
                    SLAP_SOUNDMASTER13_49669815FREQ, 0);

                // put veggie back in the pool
                v->active = 0;
                v->worldCol = 0;
                v->screenCol = 0;

                // this is where you decrement lives if there is a collision
                livesRemaining--;
                h->currFrame++;
            } else if (v->currFrame == 4) {
                // meaning it is a good pizza!
                playSoundB(MarioPowerup, MARIOPOWERUPLEN, MARIOPOWERUPFREQ, 0);

                // put veggie back in the pool
                v->active = 0;
                v->worldCol = 0;
                v->screenCol = 0;

                if (p->currFrame < 3) {
                    p->currFrame++;
                }
                if (p->currFrame == 3) {
                    pizzaAchieved = 1;
                }
            }
        }
    }
    v->screenCol = v->worldCol - hOff; //modified to use separate hOff
    v->screenRow = v->worldRow - vOff;
}

//----------------------------------------------------------------------------------
// HEALTH STATUS FUNCTIONS

void initHealth() {
    healthBar.screenRow = 5;
    healthBar.screenCol = 205;
    healthBar.width = 32;
    healthBar.height = 16;
    healthBar.aniState = 5;
    healthBar.currFrame = 0;
    healthBar.active = 1;
    healthBar.index = 4;
}

void drawHealthorPizza(ANISPRITE* h) {
    shadowOAM[h->index].attr0 = h->screenRow | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[h->index].attr1 = h->screenCol | ATTR1_MEDIUM;
    shadowOAM[h->index].attr2 = ATTR2_TILEID((h->aniState) * 4, (h->currFrame) * 2) | ATTR2_PALROW(0);

}


//----------------------------------------------------------------------------------
// PIZZA BAR FUNCTIONS

void initPizzaBar() {
    pizzaBar.screenRow = 5;
    pizzaBar.screenCol = 5;
    pizzaBar.width = 32;
    pizzaBar.height = 16;
    pizzaBar.aniState = 6;
    pizzaBar.currFrame = 0;
    pizzaBar.active = 1;
    pizzaBar.index = 5;
}