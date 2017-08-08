//
//  OffsetRange.swift
//  Taylor
//
//  Created by Alexandru Culeva on 4/12/16.
//  Copyright © 2016 YOPESO. All rights reserved.
//

import Foundation

public struct OffsetRange {
    public var start: Int
    public var end: Int
    
    public init(start: Int, end: Int) {
        self.start = start
        self.end = end
    }
}

extension OffsetRange: Comparable { }

public func ==(lhs: OffsetRange, rhs: OffsetRange) -> Bool {
    return lhs.start == rhs.start && lhs.end == rhs.end
}

public func <(lhs: OffsetRange, rhs: OffsetRange) -> Bool {
    return lhs.start < rhs.start
}

extension OffsetRange: RangeType {
    init(range: NSRange) {
        start = range.location
        end = range.location + range.length
    }
}

extension OffsetRange {
    func toEmptyLineRange() -> OffsetRange {
        return OffsetRange(start: self.start + 1, end: self.end - 1)
    }
}
