//
//  Attribute.swift
//  PredicateKit
//

import Foundation

/// An attribute, representing an attribute on a model
public struct Attribute<AttributeType> {
    public let key: String

    public init(_ key: String) {
        self.key = key
    }

    /// Builds a compound attribute with other key paths
    public init(attributes: String...) {
        self.init(attributes.joined(separator: "."))
    }

    /// Returns an expression for the attribute
    public var expression: NSExpression {
        return NSExpression(forKeyPath: key)
    }

    public func ascending() -> NSSortDescriptor {
        return NSSortDescriptor(key: key, ascending: true)
    }

    public func descending() -> NSSortDescriptor {
        return NSSortDescriptor(key: key, ascending: false)
    }

    public func attribute<T>(attribute: Attribute<T>) -> Attribute<T> {
        return Attribute<T>(attributes: key, attribute.key)
    }

    func expressionForValue(value: AttributeType?) -> NSExpression {
        if let value = value as? NSObject {
            return NSExpression(forConstantValue: value)
        }
        return NSExpression(forConstantValue: NSNull())
    }

}

extension Attribute: Equatable {
    public static func == (lhs: Attribute, rhs: Attribute) -> Bool {
        return lhs.key == rhs.key
    }
}

public func == <AttributeType>(left: Attribute<AttributeType>, right: AttributeType?) -> NSPredicate {
    return left.expression == left.expressionForValue(value: right)
}

public func != <AttributeType>(left: Attribute<AttributeType>, right: AttributeType?) -> NSPredicate {
    return left.expression != left.expressionForValue(value: right)
}

public func > <AttributeType>(left: Attribute<AttributeType>, right: AttributeType?) -> NSPredicate {
    return left.expression > left.expressionForValue(value: right)
}

public func >= <AttributeType>(left: Attribute<AttributeType>, right: AttributeType?) -> NSPredicate {
    return left.expression >= left.expressionForValue(value: right)
}

public func < <AttributeType>(left: Attribute<AttributeType>, right: AttributeType?) -> NSPredicate {
    return left.expression < left.expressionForValue(value: right)
}

public func <= <AttributeType>(left: Attribute<AttributeType>, right: AttributeType?) -> NSPredicate {
    return left.expression <= left.expressionForValue(value: right)
}

public func ~= <AttributeType>(left: Attribute<AttributeType>, right: AttributeType?) -> NSPredicate {
    return left.expression ~= left.expressionForValue(value: right)
}

public func << <AttributeType>(left: Attribute<AttributeType>, right: [AttributeType]) -> NSPredicate {
    return left.expression << NSExpression(forConstantValue: right)
}

public func << <AttributeType>(left: Attribute<AttributeType>, right: Range<AttributeType>) -> NSPredicate {
    return NSComparisonPredicate(
        leftExpression: left.expression,
        rightExpression: NSExpression(forConstantValue: [right.lowerBound, right.upperBound]),
        modifier: .direct,
        type: .between,
        options: []
    )
}

prefix public func ! (left: Attribute<Bool>) -> NSPredicate {
    return left == false
}

public func count<C: Collection>(_ attribute: Attribute<C>) -> Attribute<Int>
    where C.Iterator.Element: Hashable {
    return Attribute<Int>(attributes: attribute.key, "@count")
}
