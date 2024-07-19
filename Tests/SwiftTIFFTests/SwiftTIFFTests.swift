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
		let tiff = try TIFFImage(path: "/Users/rmann/Projects/Personal/SwiftTIFF/test1.tiff")
		
		let tp = UnsafeMutablePointer<OpaquePointer>(tiff.tiff!)
		let tpr = UnsafeMutableRawPointer(tp)
		let geo = GTIFNewSimpleTags(tpr)
		GTIFPrint(geo,nil,nil)
	}
}
