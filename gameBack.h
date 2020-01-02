
//{{BLOCK(gameBack)

//======================================================================
//
//	gameBack, 1024x256@4, 
//	+ palette 256 entries, not compressed
//	+ 283 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 128x32 
//	Total size: 512 + 9056 + 8192 = 17760
//
//	Time-stamp: 2019-11-25, 13:31:29
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBACK_H
#define GRIT_GAMEBACK_H

#define gameBackTilesLen 9056
extern const unsigned short gameBackTiles[4528];

#define gameBackMapLen 8192
extern const unsigned short gameBackMap[4096];

#define gameBackPalLen 512
extern const unsigned short gameBackPal[256];

#endif // GRIT_GAMEBACK_H

//}}BLOCK(gameBack)
