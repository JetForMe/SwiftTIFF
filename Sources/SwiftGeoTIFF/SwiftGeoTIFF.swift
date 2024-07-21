//
//  SwiftGeoTIFF.swift
//  SwiftTIFF
//
//  Created by Rick Mann on 2024-07-20.
//

import SwiftTIFF

import libgeotiff

/**
	GeoTIFFImage
	
	Spec: http://geotiff.maptools.org/spec/contents.html
*/

public
class
GeoTIFFImage : TIFFImage
{
	public
	override
	convenience
	init(path: String)
		throws
	{
		let tiff = XTIFFOpen(path, "r")
		if tiff == nil
		{
			throw Errors.cannotOpen
		}
		
		self.init(tiff: tiff!)
		
		let tp = UnsafeMutablePointer<OpaquePointer>(tiff!)
		self.gtif = GTIFNew(tp)
	}
	
	deinit
	{
		GTIFFree(self.gtif)
	}
	
	func
	getDirectoryInfo()
	{
		var versions = [Int32](repeating: 0, count: 3)
		var keyCount: Int32 = 0
		GTIFDirectoryInfo(self.gtif, &versions, &keyCount)
	}
	
	
	
	var	gtif		:	OpaquePointer!			//	TODO: Figure out why making this non-optional paints me into a designated initializer mess
}

//	MARK: - • Model Type -

public
extension
GeoTIFFImage
{
	enum
	ModelType : Equatable
	{
		case projected
		case geographic
		case geocentric
		case unknown(Int)				//	Associated value is value of model type in GeoTIFF file
	}
	
	var
	modelType: ModelType
	{
		var modelType: UInt16 = 0
		let readCount = GTIFKeyGetSHORT(self.gtif, GTModelTypeGeoKey, &modelType, 0, 1)
		if readCount != 1
		{
			return .unknown(0)
		}
		
		switch modelType
		{
			case 1:		return .projected
			case 2: 	return .geographic
			case 3:		return .geocentric
			default:
				return .unknown(Int(modelType))
		}
	}
}
