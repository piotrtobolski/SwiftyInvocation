import UIKit
import XCTest
import SwiftyInvocation

class SwiftyInvocationTests: XCTestCase {


    func testGetImplementationWithoutParametersReturning3() {
        let array: NSArray = ["1", "2", "3"]

        let selector = #selector(getter: NSArray.count)
        typealias Type = @convention(c) (AnyObject, Selector) -> UnsafeRawPointer
        let implementation = try! swift_getImplementation(object: array, selector: selector, type: Type.self)
        let returnValue = implementation(array, selector)

        let returnValueAsInt = unsafeBitCast(returnValue, to: Int.self)

        XCTAssertEqual(returnValueAsInt, 3)
    }

    func testGetImplementationWithoutParametersReturning0() {
        let array: NSArray = []

        let selector = #selector(getter: NSArray.count)
        typealias Type = @convention(c) (AnyObject, Selector) -> UnsafeRawPointer
        let implementation = try! swift_getImplementation(object: array, selector: selector, type: Type.self)
        let returnValue = implementation(array, selector)

        let returnValueAsInt = unsafeBitCast(returnValue, to: Int.self)

        XCTAssertEqual(returnValueAsInt, 0)
    }

    func testGetImplementationWithIntParameterReturningObject() {
        let array: NSArray = ["1", "2", "3"]

        let selector = #selector(NSArray.object(at:))
        typealias Type = @convention(c) (AnyObject, Selector, Int) -> Unmanaged<NSString>
        let implementation = try! swift_getImplementation(object: array, selector: selector, type: Type.self)
        let returnValue = implementation(array, selector, 1)

        let returnValueAsString = returnValue.takeUnretainedValue()

        XCTAssertEqual(returnValueAsString, "2")
    }

    func testGetImplementationWithObjectParameterReturningVoid() {
        let array: NSMutableArray = ["1", "2", "3"]

        let selector = #selector(NSMutableArray.add(_:))
        typealias Type = @convention(c) (AnyObject, Selector, AnyObject) -> Void
        let implementation = try! swift_getImplementation(object: array, selector: selector, type: Type.self)
        implementation(array, selector, "4" as AnyObject)

        XCTAssertEqual(array, ["1", "2", "3", "4"])
    }

    func testGetImplementationWithObjectAndIntParameterReturningVoid() {
        let array: NSMutableArray = ["1", "2", "3"]

        let selector = #selector(NSMutableArray.insert(_:at:) as (NSMutableArray) -> (Any, Int) -> Void)
        typealias Type = @convention(c) (AnyObject, Selector, AnyObject, Int) -> Void
        let implementation = try! swift_getImplementation(object: array, selector: selector, type: Type.self)
        implementation(array, selector, "0" as AnyObject, 0)

        XCTAssertEqual(array, ["0", "1", "2", "3"])
    }

    func testSIInvocation() {
        let array: NSArray = ["1", "2", "3"]

        let selector = #selector(NSArray.object(at:))
        let methodSignature = NSArray.si_instanceMethodSignature(for: selector)
        let invocation = SIInvocation(methodSignature: methodSignature)
        invocation.target = array
        invocation.selector = selector
        var argument = 1
        invocation.setArgument(&argument, at: 2)
        invocation.retainArguments()

        invocation.invoke()

        var returnValue: Unmanaged<NSString>?
        invocation.getReturnValue(&returnValue)

        XCTAssertEqual(returnValue?.takeUnretainedValue(), "2")
    }
}
