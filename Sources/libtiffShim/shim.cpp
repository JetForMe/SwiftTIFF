//
//  shim.c
//  
//
//  Created by Rick Mann on 2024-07-19.
//

#include "shim.hpp"

#include <tiff.h>
#include <tiffio.h>
#include <geotiff.h>

uint32_t
TIFFGetWidth(const TIFF* inTIFF)
{
	uint32_t width = 0;
	TIFFGetField(const_cast<TIFF*>(inTIFF), TIFFTAG_IMAGEWIDTH, &width);
	return width;
}

uint32_t
TIFFGetHeight(const TIFF* inTIFF)
{
	uint32_t width = 0;
	TIFFGetField(const_cast<TIFF*>(inTIFF), TIFFTAG_IMAGEWIDTH, &width);
	return width;
}
