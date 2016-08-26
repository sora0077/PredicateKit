//
//  Expression.swift
//  PredicateKit
//

import Foundation

/// Returns an equality predicate for the two given expressions
public func == (left: NSExpression, right: NSExpression) -> NSPredicate {
    return NSComparisonPredicate(
        leftExpression: left,
        rightExpression: right,
        modifier: .direct,
        type: .equalTo,
        options: []
    )
}

/// Returns an inequality predicate for the two given expressions
public func != (left: NSExpression, right: NSExpression) -> NSPredicate {
    return NSComparisonPredicate(
        leftExpression: left,
        rightExpression: right,
        modifier: .direct,
        type: .notEqualTo,
        options: []
    )
}

public func > (left: NSExpression, right: NSExpression) -> NSPredicate {
    return NSComparisonPredicate(
        leftExpression: left,
        rightExpression: right,
        modifier: .direct,
        type: .greaterThan,
        options: []
    )
}

public func >= (left: NSExpression, right: NSExpression) -> NSPredicate {
    return NSComparisonPredicate(
        leftExpression: left,
        rightExpression: right,
        modifier: .direct,
        type: .greaterThanOrEqualTo,
        options: []
    )
}

public func < (left: NSExpression, right: NSExpression) -> NSPredicate {
    return NSComparisonPredicate(
        leftExpression: left,
        rightExpression: right,
        modifier: .direct,
        type: .lessThan,
        options: []
    )
}

public func <= (left: NSExpression, right: NSExpression) -> NSPredicate {
    return NSComparisonPredicate(
        leftExpression: left,
        rightExpression: right,
        modifier: .direct,
        type: .lessThanOrEqualTo,
        options: []
    )
}

public func ~= (left: NSExpression, right: NSExpression) -> NSPredicate {
    return NSComparisonPredicate(
        leftExpression: left,
        rightExpression: right,
        modifier: .direct,
        type: .like,
        options: []
    )
}

public func << (left: NSExpression, right: NSExpression) -> NSPredicate {
    return NSComparisonPredicate(
        leftExpression: left,
        rightExpression: right,
        modifier: .direct,
        type: .in,
        options: []
    )
}
