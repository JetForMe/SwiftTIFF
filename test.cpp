#include <stdio.h>

#include <geotiff.h>
#include <tiff.h>
#include <tiffio.h>

/**
	Build and run with:
	
	% clang `pkg-config --cflags --libs libtiff-4` `pkg-config --cflags --libs libgeotiff` test.cpp -o test && ./test
*/

int
main(int inArgC, const char** inArgV)
{
	printf("Test geotiff\n");
	
	TIFF* tiff = TIFFOpen("/Users/rmann/Downloads/BigTIFFSamples/BigTIFFSubIFD8.tif", "r");
	if (tiff == NULL)
	{
		fprintf(stderr, "Unable to open file\n");
		return 1;
	}
	GTIF* gtif = GTIFNewSimpleTags(tiff);
	if (gtif == NULL)
	{
		fprintf(stderr, "Unable to read GTIF tags\n");
		return 1;
	}
	
	return 0;
}
