//
//  shim.hpp
//  
//
//  Created by Rick Mann on 2024-07-20.
//

#include <tiff.h>
#include <tiffio.h>


#ifdef __cplusplus
extern "C" {
#endif

uint32_t			TIFFGetWidth(const TIFF* inTIFF);
uint32_t			TIFFGetHeight(const TIFF* inTIFF);

#ifdef __cplusplus
}	//	extern "C"
#endif
