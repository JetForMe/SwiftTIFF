// The Swift Programming Language
// https://docs.swift.org/swift-book


import libtiff
import libtiffShim

/**
	TODO: I’m not sure I want this to be open. Unfortunately, libgeotiff requires that TIFF files be opened
			using `XTIFFOpen()`, which means the derived ``GeoTIFFImage`` class in another module needs to inherit
			from ``TIFFImage``.
*/

open
class
TIFFImage
{
	public
	init(tiff: OpaquePointer)
	{
		self.tiff = tiff
	}
	
	public
	init(path: String)
		throws
	{
		let tiff = TIFFOpen(path, "r")
		if tiff == nil
		{
			throw Errors.cannotOpen
		}
		
		self.tiff = tiff!
	}
	
	deinit
	{
		TIFFClose(self.tiff)
	}
	
	var
	width: Int
	{
		let v = TIFFGetWidth(self.tiff)
		return Int(v)
	}
	
	var
	height: Int
	{
		let v = TIFFGetHeight(self.tiff)
		return Int(v)
	}
	
	let tiff			:	OpaquePointer
}


extension
TIFFImage
{
	public
	enum
	Errors : Error
	{
		case cannotOpen
	}
}


