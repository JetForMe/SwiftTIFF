import XCTest

@testable import SwiftTIFF

import libgeotiff


final
class
SwiftTIFFTests : XCTestCase
{
	func
	testExample()
		throws
	{
//		let tiff = try TIFFImage(path: "/Users/rmann/Projects/Personal/SwiftTIFF/test1.tiff")
//		let tif = tiff.tiff!
		let tif = XTIFFOpen("/Users/rmann/Projects/Personal/SwiftTIFF/test1.tiff", "r")!
		let tp = UnsafeMutablePointer<OpaquePointer>(tif)
		let tpr = UnsafeMutableRawPointer(tp)
		let geo = GTIFNew(tpr)
		GTIFPrint(geo,nil,nil)
		
		var width = GTIFGetWidth(tif)
	}
}
