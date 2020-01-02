/**
 * What has been added since M04:
 *      -a cheat
 *
 * What needs to be added:
 *      -another sprite with looping animation (pixel art is done)
 * 
 * Bugs:
 *      -there seems to be some vegetables appearing in middle of screen not the top
 *      -I commented it out in the pause method, but I tried to add an animated sprite 
 *          for that screen and it wasn't working so I will need to look at that again :')
 *      -there might be a bug where if you win it doesn't reset correctly
 */

#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"
#include "gameBack.h"
#include "startScreen.h"
#include "instructionsScreen.h"
#include "pauseScreen.h"
#include "winScreen.h"
#include "sound.h"
#include "OriginalGameMusic.h"
#include "chaseMusic.h"
#include "loseScreen.h"
#include "mlg-airhorn.h"
#include "startMusic.h"

void initialize();

void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

enum {START, INSTRUCTIONS, GAME, PAUSE, WIN, LOSE};
int state;

unsigned short buttons;
unsigned short oldButtons;

int seed;

OBJ_ATTR shadowOAM[128];


int main() {

    initialize();

    setupSounds();
    setupInterrupts();

    while(1) {

        oldButtons = buttons;
        buttons = BUTTONS;

        switch(state) {

            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }

    }
}

void initialize() {
    // set up display control register
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    REG_BG0CNT = BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    
    goToStart();
}

void goToStart() {
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, shadowOAM, OAM, 128 * 4);


    //load in the startScreen tiles and map to char and screenblocks
    DMANow(3, startScreenTiles, &CHARBLOCK[0], startScreenTilesLen/2);
    DMANow(3, startScreenMap, &SCREENBLOCK[28], startScreenMapLen/2);
    DMANow(3, startScreenPal, PALETTE, 256);

    hideSprites();
    stopSound();
    playSoundA(startMusic, STARTMUSICLEN, STARTMUSICFREQ, 1);
    

    state = START;

    seed = 0;
}

void start() {

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    seed++;
    
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);

    
    hideSprites();

    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);

        initGame();
        hideSprites();
        goToGame();
    }

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        hideSprites();
        goToInstructions();
    }
}

void goToInstructions() {

    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

    DMANow(3, instructionsScreenTiles, &CHARBLOCK[0], instructionsScreenTilesLen/2);
    DMANow(3, instructionsScreenMap, &SCREENBLOCK[28], instructionsScreenMapLen/2);
    DMANow(3, instructionsScreenPal, PALETTE, 256);
    
    stopSound();


    state = INSTRUCTIONS;
}

void instructions() {
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    waitForVBlank();  
    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToGame() {

    REG_BG0CNT = BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    // load in tiles and map for gameBack
    DMANow(3, gameBackTiles, &CHARBLOCK[0], gameBackTilesLen/2);
    DMANow(3, gameBackMap, &SCREENBLOCK[28], gameBackMapLen/2);
    DMANow(3, gameBackPal, PALETTE, 256);

    stopSound();

    playSoundA(chaseMusic, CHASEMUSICLEN, CHASEMUSICFREQ, 1);
    hideSprites();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);
    
    state = GAME;
}

void game() {

    updateGame();
    drawGame();  

    waitForVBlank();  
    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (BUTTON_PRESSED(BUTTON_START)) {
        hideSprites();
        initPause();
        goToPause(); 
    } else if (BUTTON_PRESSED(BUTTON_B)) {
        // toggle the cheat by pressing the B button
        if (cheatOn) {
            cheatOn = 0;
        } else {
            cheatOn = 1;
        }
    } else {
        if (livesRemaining == 0) {
            cheatOn = 0;
            goToLose();
        }
        if (inTheDumpster) {
            cheatOn = 0;
            goToWin();
        }
    }
}

void goToPause() {
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    // load in tiles and map for pauseScreen
    DMANow(3, pauseScreenTiles, &CHARBLOCK[0], pauseScreenTilesLen/2);
    DMANow(3, pauseScreenMap, &SCREENBLOCK[28], pauseScreenMapLen/2);
    DMANow(3, pauseScreenPal, PALETTE, 256);

    stopSound();

    hideSprites();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = PAUSE;
}

void pause() {
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    updatePause();
    drawAll();

    waitForVBlank();  
    DMANow(3, shadowOAM, OAM, 128 * 4); 

    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        
        goToStart();
}

void goToWin() {
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    // load in tiles and map for winScreen
    DMANow(3, winScreenTiles, &CHARBLOCK[0], winScreenTilesLen/2);
    DMANow(3, winScreenMap, &SCREENBLOCK[28], winScreenMapLen/2);
    DMANow(3, winScreenPal, PALETTE, 256);

    stopSound();
    playSoundA(mlg_airhorn, MLG_AIRHORNLEN, MLG_AIRHORNFREQ, 0);

    hideSprites();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);


    state = WIN;
}

void win() {
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    waitForVBlank();

    inTheDumpster = 0;
    livesRemaining = 4;
    pizzaAchieved = 0;


    if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

void goToLose() {
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    // load in tiles and map for gameOver
    DMANow(3, loseScreenTiles, &CHARBLOCK[0], loseScreenTilesLen/2);
    DMANow(3, loseScreenMap, &SCREENBLOCK[28], loseScreenMapLen/2);
    DMANow(3, loseScreenPal, PALETTE, 256);

    stopSound();
    playSoundB(OriginalGameMusic, ORIGINALGAMEMUSICLEN, ORIGINALGAMEMUSICFREQ, 0);

    hideSprites();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    // reset livesRemaining for new game
    livesRemaining = 4;

    state = LOSE;
}

void lose() {
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}