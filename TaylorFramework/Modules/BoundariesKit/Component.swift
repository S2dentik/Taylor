//
//  Component.swift
//  BoundariesKit
//
//  Created by Andrei Raifura on 9/3/15.
//  Copyright © 2015 YOPESO. All rights reserved.
//

public final class Component {
    public var parent: Component?
    public let type: ComponentType
    public let range: ComponentRange
    public var name: String?
    public var components = [Component]()
    
    public init(type: ComponentType, range: ComponentRange, name: String? = nil) {
        self.type = type
        self.range = range
        self.name = name
    }
    
    public func makeComponent(type: ComponentType, range: ComponentRange, name: String? = nil) -> Component {
        let component = Component(type: type, range: range, name: name)
        
        component.parent = self
        self.components.append(component)
        
        return component
    }
}

extension Component : Hashable {
    public var hashValue: Int {
        let initialValue = range.startLine.hashValue + range.endLine.hashValue + type.hashValue
        return components.reduce(initialValue) { $0 + $1.hashValue }
    }
}

extension Component : Equatable {}

public func ==(lhs: Component, rhs: Component) -> Bool {
    return lhs.range == rhs.range &&
        lhs.type == rhs.type &&
        lhs.name == rhs.name &&
        (Set(lhs.components) == Set(rhs.components))
}
