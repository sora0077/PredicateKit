//
//  AttributeTests.swift
//  PredicateKit
//

import XCTest
import PredicateKit


class AttributeTests: XCTestCase {
    
    var attribute: Attribute<Int>!
    
    override func setUp() {
        super.setUp()
        attribute = Attribute("age")
    }
    
    func testAttributeHasKey() {
        XCTAssertEqual(attribute.key, "age")
    }
    
    func testAttributeExpression() {
        XCTAssertEqual(attribute.expression.keyPath, "age")
    }
    
    func testEqualAttributesAreEquatable() {
        XCTAssertEqual(attribute, Attribute<Int>("age"))
    }
    
    func testCompoundAttributeCreation() {
        let personCompanyNameAttribute = Attribute<String>(attributes: "company", "name")
        
        XCTAssertEqual(personCompanyNameAttribute.key, "company.name")
        XCTAssertEqual(personCompanyNameAttribute.expression.keyPath, "company.name")
    }
    
    // Sorting
    
    func testAscendingSortDescriptor() {
        XCTAssertEqual(attribute.ascending(), NSSortDescriptor(key: "age", ascending: true))
    }
    
    func testDescendingSortDescriptor() {
        XCTAssertEqual(attribute.descending(), NSSortDescriptor(key: "age", ascending: false))
    }
    
    // Operators
    
    func testEqualityOperator() {
        let predicate = attribute == 10
        XCTAssertEqual(predicate, NSPredicate(format: "age == 10"))
    }
    
    func testInequalityOperator() {
        let predicate = attribute != 10
        XCTAssertEqual(predicate, NSPredicate(format: "age != 10"))
    }
    
    func testGreaterThanOperator() {
        let predicate = attribute > 10
        XCTAssertEqual(predicate, NSPredicate(format: "age > 10"))
    }
    
    func testGreaterOrEqualThanOperator() {
        let predicate = attribute >= 10
        XCTAssertEqual(predicate, NSPredicate(format: "age >= 10"))
    }
    
    func testLessThanOperator() {
        let predicate = attribute < 10
        XCTAssertEqual(predicate, NSPredicate(format: "age < 10"))
    }
    
    func testLessOrEqualThanOperator() {
        let predicate = attribute <= 10
        XCTAssertEqual(predicate, NSPredicate(format: "age <= 10"))
    }
    
    func testLikeOperator() {
        let predicate = attribute ~= 10
        XCTAssertEqual(predicate, NSPredicate(format: "age LIKE 10"))
    }
    
    func testInOperator() {
        let predicate = attribute << [5, 10]
        XCTAssertEqual(predicate, NSPredicate(format: "age IN %@", [5, 10]))
    }
    
    func testBetweenRangeOperator() {
        let predicate = attribute << (5..<10)
        XCTAssertEqual(predicate, NSPredicate(format: "age BETWEEN %@", [5, 10]))
    }
    
    func testOptionalEqualityOperator() {
        let attribute = Attribute<String?>("name")
        let predicate = attribute == "kyle"
        XCTAssertEqual(predicate, NSPredicate(format: "name == 'kyle'"))
    }
    
    func testOptionalNSObjectEqualityOperator() {
        let attribute = Attribute<NSString?>("name")
        let predicate = attribute == "kyle"
        XCTAssertEqual(predicate, NSPredicate(format: "name == 'kyle'"))
    }
    
    func testEqualityOperatorWithNilRHS() {
        let attribute = Attribute<String?>("name")
        let predicate = attribute == nil
        XCTAssertEqual(predicate.description, "name == <null>")
    }
}

class CollectionAttributeTests: XCTestCase {
    
    func testCountOfSet() {
        let setAttribute = Attribute<Set<String>>("names")
        let countAttribute = count(setAttribute)
        XCTAssertEqual(countAttribute, Attribute<Int>("names.@count"))
    }
}
