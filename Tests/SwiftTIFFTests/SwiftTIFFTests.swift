import Testing

@testable import SwiftTIFF
@testable import SwiftGeoTIFF

import libgeotiff
import libtiffShim


import Foundation


struct
GeoTIFFTests
{
	@Test
	func testModelType()
		throws
	{
		let test1 = try #require(Bundle.module.url(forResource: "test1", withExtension: "tiff", subdirectory: "Resources"))
		let tiff = try GeoTIFFImage(path: test1.path)
		#expect(tiff.modelType == .geographic)
	}


//
//	@Test
//	func testExample()
//		throws
//	{
////		let tiff = try TIFFImage(path: "Resources/test1.tiff")
////		let tif = tiff.tiff!
//		let tif = XTIFFOpen("Resources/test1.tiff", "r")!
//		let tp = UnsafeMutablePointer<OpaquePointer>(tif)
//		let tpr = UnsafeMutableRawPointer(tp)
//		let geo = GTIFNew(tpr)
//		GTIFPrint(geo,nil,nil)
//		
//		let width = TIFFGetWidth(tif)
//		print("Width: \(width)")
//	}
//	
//	@Test
//	func testGeoTIFF()
//		throws
//	{
//		let tiff = try GeoTIFFImage(path: "Resources/test1.tiff")
//		GTIFPrint(tiff.gtif, nil, nil)
//		tiff.getDirectoryInfo()
//		
//		var tagSize: UInt32 = 0
//		var tagType: tagtype_t = TYPE_UNKNOWN
//		
//		let keyCount = GTIFKeyInfo(tiff.gtif, GTModelTypeGeoKey, &tagSize, &tagType)
//		var modelType: UInt16 = 0
//		let readCount = GTIFKeyGetSHORT(tiff.gtif, GTModelTypeGeoKey, &modelType, 0, 1)
//		print("Model type: \(modelType)")
//		#expect(keyCount == 1)
//		#expect(readCount == 1)
//		
//		let mt = tiff.modelType
//		print("Model type: \(mt)")
//	}
}
