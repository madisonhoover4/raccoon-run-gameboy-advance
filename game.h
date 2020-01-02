// sprite struct
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
    int phOff;
} ANISPRITE;

// constants
#define MAPHEIGHT 256
#define MAPWIDTH 1024
#define VEGETABLECOUNT 20

// sprite constants
#define ROWMASK 0xFF
#define COLMASK 0x1FF

// extern variables
extern ANISPRITE player;
extern ANISPRITE vegetables[VEGETABLECOUNT];
extern ANISPRITE healthBar;
extern ANISPRITE pizzaBar;
extern int frameCount;
extern int livesRemaining;
extern int inTheDumpster;
extern int cheatOn;
extern int pizzaAchieved;
extern int randVeggieIndex;
extern int randPizzaIndex;

// prototypes for game functions
void initGame();
void updateGame();
void drawGame();

// prototypes for player
void initPlayer();
void drawPlayer();
void updatePlayer();
void animatePlayer();

//prototypes for dumpster
void initDumpster();
void updateDumpster(ANISPRITE* d);
void drawDumpster();

//prototypes for vegetables
void initVeggies();
void fireVeggie(ANISPRITE* v);
void drawVeggie(ANISPRITE* v);
void updateVeggie(ANISPRITE* v, ANISPRITE* h, ANISPRITE* p);

// prototypes for health
void initHealth();
void updateHealth();
void drawHealthorPizza();

//prototypes for pizza bar
void initPizzaBar();

