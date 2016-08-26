//
//  PredicateTests.swift
//  PredicateKit
//

import XCTest
import PredicateKit


class NSPredicateTests: XCTestCase {
    
    var namePredicate = NSPredicate(format: "name == Kyle")
    var agePredicate = NSPredicate(format: "age >= 21")
    
    func testAndPredicate() {
        let predicate = namePredicate && agePredicate
        XCTAssertEqual(predicate, NSPredicate(format: "name == Kyle AND age >= 21"))
    }
    
    func testOrPredicate() {
        let predicate = namePredicate || agePredicate
        XCTAssertEqual(predicate, NSPredicate(format: "name == Kyle OR age >= 21"))
    }
    
    func testNotPredicate() {
        let predicate = !namePredicate
        XCTAssertEqual(predicate, NSPredicate(format: "NOT name == Kyle"))
    }
}
