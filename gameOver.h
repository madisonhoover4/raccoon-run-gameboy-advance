
//{{BLOCK(gameOver)

//======================================================================
//
//	gameOver, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 20 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 640 + 2048 = 3200
//
//	Time-stamp: 2019-11-12, 10:55:41
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEOVER_H
#define GRIT_GAMEOVER_H

#define gameOverTilesLen 640
extern const unsigned short gameOverTiles[320];

#define gameOverMapLen 2048
extern const unsigned short gameOverMap[1024];

#define gameOverPalLen 512
extern const unsigned short gameOverPal[256];

#endif // GRIT_GAMEOVER_H

//}}BLOCK(gameOver)
