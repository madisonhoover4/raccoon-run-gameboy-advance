
//{{BLOCK(skyBack)

//======================================================================
//
//	skyBack, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 808 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 25856 + 4096 = 30464
//
//	Time-stamp: 2019-11-11, 19:44:01
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SKYBACK_H
#define GRIT_SKYBACK_H

#define skyBackTilesLen 25856
extern const unsigned short skyBackTiles[12928];

#define skyBackMapLen 4096
extern const unsigned short skyBackMap[2048];

#define skyBackPalLen 512
extern const unsigned short skyBackPal[256];

#endif // GRIT_SKYBACK_H

//}}BLOCK(skyBack)
