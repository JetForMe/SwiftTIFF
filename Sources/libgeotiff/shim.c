//
//  shim.c
//  
//
//  Created by Rick Mann on 2024-07-19.
//

#include <geotiff.h>
#include <tiff.h>


uint64_t
GTIFGetWidth(const TIFF* inGTIF)
{
	uint64_t width = 0;
	TIFFGetField(tif, TIFFTAG_IMAGEWIDTH, &width);
	return width;
}
