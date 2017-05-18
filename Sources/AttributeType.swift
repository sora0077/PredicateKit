//
//  AttributeType.swift
//  PredicateKit
//
//  Created by 林達也 on 2017/05/13.
//  Copyright © 2017年 jp.sora0077. All rights reserved.
//

import Foundation

public protocol AttributeType {
    var expression: NSExpression { get }
}

extension Bool: AttributeType {
    public var expression: NSExpression {
        return NSExpression(forConstantValue: self)
    }
}
extension String: AttributeType {
    public var expression: NSExpression {
        return NSExpression(forConstantValue: self)
    }
}
extension Int: AttributeType {
    public var expression: NSExpression {
        return NSExpression(forConstantValue: self)
    }
}
extension Float: AttributeType {
    public var expression: NSExpression {
        return NSExpression(forConstantValue: self)
    }
}
extension Double: AttributeType {
    public var expression: NSExpression {
        return NSExpression(forConstantValue: self)
    }
}
extension Date: AttributeType {
    public var expression: NSExpression {
        return NSExpression(forConstantValue: self)
    }
}
extension Array: AttributeType {
    public var expression: NSExpression {
        return NSExpression(forConstantValue: self)
    }
}
extension Set: AttributeType {
    public var expression: NSExpression {
        return NSExpression(forConstantValue: self)
    }
}
