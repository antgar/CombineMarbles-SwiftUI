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
}

struct OperatorMarbleValues {
    let line1: [MarbleElementType]
}

extension Operator {
    var initial: OperatorMarbleValues {
        switch self {
        case .map:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "1", color: .red),
                MarbleElementType(value: "2", color: .blue),
                MarbleElementType(value: "3", color: .black)
                ])
        }
    }
    
    var transformText: String {
        switch self {
        case .map:
            return "map {$0 * 10}"
        }
    }
    
    func transform() -> AnyPublisher<[Int], Error> {
        switch self {
        case .map:
            let numberValues = initial.line1.map {Int($0.value)!}
            return Publishers.Sequence(sequence: numberValues)
            .map {$0 * 10}
            .collect()
            .eraseToAnyPublisher()
        }
    }
}

