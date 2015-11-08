//
//  HasAssociatedObjectsTests.swift
//
//  Created by ToKoRo on 2015-11-07.
//

import XCTest
@testable import HasAssociatedObjects

class HasAssociatedObjectsTests: XCTestCase {

    class Subject: HasAssociatedObjects {
    }

    let subject = Subject()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        subject.associatedObjects.removeAll()

        super.tearDown()
    }
    
    func testAssociatedInt() {
        let key = "INT"
        subject.associatedObjects[key] = 10

        let storedValue = subject.associatedObjects[key] as? Int
        XCTAssertEqual(10, storedValue)
    }

    func testAssociatedString() {
        let key = "STRING"
        subject.associatedObjects[key] = "hoge"

        let storedValue = subject.associatedObjects[key] as? String
        XCTAssertEqual("hoge", storedValue)
    }

    func testAssociatedDictionary() {
        let key = "DICTIONARY"

        let dict: [String : AnyObject] = [
            "key1": "value1",
            "key2": "value2",
        ]
        subject.associatedObjects[key] = dict

        let storedValue = subject.associatedObjects[key] as? [String : AnyObject]
        XCTAssertEqual("value1", storedValue?["key1"] as? String)
        XCTAssertEqual("value2", storedValue?["key2"] as? String)
    }

    func testMultipleValue() {
        let key1 = "INT"
        let key2 = "STRING"

        subject.associatedObjects[key1] = 200
        subject.associatedObjects[key2] = "huga"

        XCTAssertEqual(200, subject.associatedObjects[key1] as? Int)
        XCTAssertEqual("huga", subject.associatedObjects[key2] as? String)
    }

    func testDifferenceType() {
        let key = "INT"
        subject.associatedObjects[key] = 10

        let storedValue = subject.associatedObjects[key] as? String
        XCTAssertNil(storedValue)
    }

    func testRemoveAll() {
        let key = "INT"
        subject.associatedObjects[key] = 10
        subject.associatedObjects.removeAll()

        let storedValue = subject.associatedObjects[key] as? Int
        XCTAssertNil(storedValue)
    }
    
    func testDirectly() {
        subject.associatedObjects.value = 10

        let storedValue = subject.associatedObjects.value as? Int
        XCTAssertEqual(10, storedValue)
    }

    func testExtension() {
        let subject = ExtendedSubject()

        subject.storedInt = 10
        XCTAssertEqual(10, subject.storedInt)

        subject.storedString = "hello"
        XCTAssertEqual("hello", subject.storedString)
    }

}

class ExtendedSubject {
}

extension ExtendedSubject: HasAssociatedObjects {
    var storedString: String? {
        get {
            return self.associatedObjects.value as? String
        }
        set {
            self.associatedObjects.value = newValue
        }
    }

    var storedInt: Int {
        get {
            guard let value = self.associatedObjects["INT"] as? Int else {
                return 0 //< default value
            }
            return value
        }
        set {
            self.associatedObjects["INT"] = newValue
        }
    }
}

