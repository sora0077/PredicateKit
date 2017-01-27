//
//  Predicate.swift
//  PredicateKit
//

import Foundation

/// Returns an and predicate from the given predicates
public func && (left: NSPredicate, right: NSPredicate) -> NSPredicate {
    return NSCompoundPredicate(type: .and, subpredicates: [left, right])
}

/// Returns an or predicate from the given predicates
public func || (left: NSPredicate, right: NSPredicate) -> NSPredicate {
    return NSCompoundPredicate(type: .or, subpredicates: [left, right])
}

/// Returns a predicate reversing the given predicate
prefix public func ! (left: NSPredicate) -> NSPredicate {
    return NSCompoundPredicate(type: .not, subpredicates: [left])
}
