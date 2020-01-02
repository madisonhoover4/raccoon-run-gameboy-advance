#include "myLib.h"
#include <stdlib.h>
#include "pause.h"
#include <stdio.h>
#include "spriteSheet.h"
#include "game.h"

ANISPRITE2 dancer1;
ANISPRITE2 dancer2;
ANISPRITE2 dancer3;

void initPause() {

    DMANow(3, spriteSheetPal, SPRITEPALETTE, 256);
    DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);

    initDancers(1, &dancer1);
    initDancers(2, &dancer2);
    initDancers(3, &dancer3);
}

void initDancers(int num, ANISPRITE2* dancer) {
    if (num == 1) {
        dancer->screenCol = 240/2 - 16;
        dancer->index = 100;
    }
    if (num == 2) {
        dancer->screenCol = 240/2 - 16 - 40;
        dancer->index = 101;
    }
    if (num == 3) {
        dancer->screenCol = 240/2 - 16 + 40;
        dancer->index = 102;
    }
    dancer->width = 32;
    dancer->height = 32;
    dancer->screenRow = 160/2 - 16;
    dancer->aniState = 0; 
    dancer->currFrame = 4; 
    dancer->active = 1;
    dancer->numFrames = 8; // CHANGE
    dancer->aniCounter = 0;
}

void drawAll() {
    drawDancer(&dancer1); 
    drawDancer(&dancer2); 
    drawDancer(&dancer3);
}

void drawDancer(ANISPRITE2* dancer) {
    shadowOAM[dancer->index].attr0 = dancer->screenRow | ATTR0_SQUARE | ATTR0_4BPP;
    shadowOAM[dancer->index].attr1 = dancer->screenCol | ATTR1_MEDIUM;
    shadowOAM[dancer->index].attr2 = ATTR2_TILEID(dancer->aniState * 4, dancer->currFrame * 4) | ATTR2_PALROW(0);
}

void updatePause() {
    animateDancer(&dancer1);
    animateDancer(&dancer2);
    animateDancer(&dancer3);

}

void animateDancer(ANISPRITE2* dancer) {
    if(dancer->aniCounter % 10 == 0) {
        dancer->aniState = (dancer->aniState + 1) % dancer->numFrames;
    }
    dancer->aniCounter++;
}
