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

extension AttributeType {
    public var expression: NSExpression {
        return NSExpression(forConstantValue: self)
    }
}

extension Bool: AttributeType {}
extension String: AttributeType {}
extension Int: AttributeType {}
extension Float: AttributeType {}
extension Double: AttributeType {}

extension Array: AttributeType {}
extension Set: AttributeType {}
