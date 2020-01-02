
typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int currFrame;
    int numFrames;
    int active;
    int index;
} ANISPRITE2;


extern ANISPRITE2 dancer1;
extern ANISPRITE2 dancer2;
extern ANISPRITE2 dancer3;

// pause prototypes
void initPause();
void initDancers(int num, ANISPRITE2* dancer);
void drawAll();
void drawDancer(ANISPRITE2* dancer);
void updatePause();
void animateDancer(ANISPRITE2* dancer);
