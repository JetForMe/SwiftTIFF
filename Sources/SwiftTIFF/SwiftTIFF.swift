// The Swift Programming Language
// https://docs.swift.org/swift-book


import libtiff

class
TIFFImage
{
	init(path: String)
		throws
	{
		let tiff = TIFFOpen(path, "r")
		if tiff == nil
		{
			throw Errors.cannotOpen
		}
		
		self.tiff = tiff
	}
	
	deinit
	{
		TIFFClose(self.tiff)
	}
	
	let tiff			:	OpaquePointer?
}


extension
TIFFImage
{
	enum
	Errors : Error
	{
		case cannotOpen
	}
}
