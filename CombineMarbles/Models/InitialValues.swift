//
//  InitialValues.swift
//  CombineMarbles
//
//  Created by Antoine Garcia on 13/06/2019.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct MarbleElementType {
    let value: String
    let color: Color
    let time: CGFloat
}

struct OperatorMarbleValues {
    let line1: [MarbleElementType]
}

extension Operator {
    var initial: OperatorMarbleValues {
        switch self {
        case .map:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "1", color: .red, time: 100),
                MarbleElementType(value: "2", color: .blue, time: 200),
                MarbleElementType(value: "3", color: .black, time: 300)
                ])
        case .collect:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "1", color: .red, time: 100),
                MarbleElementType(value: "2", color: .blue, time: 200),
                MarbleElementType(value: "3", color: .black, time: 300),
                MarbleElementType(value: "4", color: .black, time: 400),
                MarbleElementType(value: "5", color: .black, time: 500),
                MarbleElementType(value: "6", color: .black, time: 600)
                ])
        }
    }
    
    var transformText: String {
        switch self {
        case .map:
            return "map {$0 * 10}"
        case .collect:
            return "a.collect()"
        }
    }
    
    func transform() -> AnyPublisher<MarbleElementType, Error> {
        switch self {
        case .map:
            let numberValues = initial.line1.map {Int($0.value)!}
            return Publishers.Sequence(sequence: numberValues)
            .map {$0 * 10}
                .map {value in
                    let originalValue = initial.line1.first {String(value / 10) == $0.value}!
                    let currentColor = originalValue.color
                    return MarbleElementType(value: "\(value)", color: currentColor,
                                             time: originalValue.time)
            }.eraseToAnyPublisher()
        case .collect:
             return Publishers.Sequence(sequence: initial.line1)
                .collect()
                .map {collected in
                    let values = collected.map {$0.value}.joined(separator: ",")
                    return MarbleElementType(value: "[\(values)]",
                                             color: .green,
                                             time: 600)
            }.eraseToAnyPublisher()
        }
    }
}

