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
    enum Shape {
        case circle
        case square
    }
    
    let value: String
    let color: Color
    let time: CGFloat
    let shape: Shape

    init(value: String, color: Color, time: CGFloat, shape: Shape = .circle) {
        self.value = value
        self.color = color
        self.time = time
        self.shape = shape
    }
}

struct OperatorMarbleValues {
    let line1: [MarbleElementType]
    let line2: [MarbleElementType]?
    
    init(line1: [MarbleElementType], line2: [MarbleElementType]? = nil) {
        self.line1 = line1
        self.line2 = line2
    }
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
                MarbleElementType(value: "3", color: .yellow, time: 300),
                MarbleElementType(value: "4", color: .green, time: 400),
                MarbleElementType(value: "5", color: .orange, time: 500),
                MarbleElementType(value: "6", color: .purple, time: 600)
            ])
        case .filter:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "5", color: .red, time: 100),
                MarbleElementType(value: "15", color: .blue, time: 200),
                MarbleElementType(value: "20", color: .yellow, time: 300),
                MarbleElementType(value: "1", color: .gray, time: 400),
                MarbleElementType(value: "500", color: .orange, time: 500)
            ])
        case .removeDuplicates:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "1", color: .red, time: 100),
                MarbleElementType(value: "2", color: .blue, time: 200),
                MarbleElementType(value: "2", color: .blue, time: 300),
                MarbleElementType(value: "3", color: .black, time: 400),
                MarbleElementType(value: "2", color: .blue, time: 500)
            ])
        case .merge:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "1", color: .red, time: 100),
                MarbleElementType(value: "2", color: .blue, time: 200),
                MarbleElementType(value: "20", color: .green, time: 400),
                MarbleElementType(value: "300", color: .black, time: 600)
                ], line2:
                [
                    MarbleElementType(value: "800", color: .orange, time: 300),
                    MarbleElementType(value: "55", color: .yellow, time: 500),
            ])
        case .append:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "1", color: .red, time: 100),
                MarbleElementType(value: "2", color: .blue, time: 200),
                MarbleElementType(value: "3", color: .green, time: 400),
                ], line2:
                [
                    MarbleElementType(value: "4", color: .orange, time: 100),
                    MarbleElementType(value: "5", color: .yellow, time: 300),
            ])
        case .dropFirst:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "1", color: .red, time: 100),
                MarbleElementType(value: "2", color: .blue, time: 200),
                MarbleElementType(value: "3", color: .blue, time: 300),
                MarbleElementType(value: "4", color: .yellow, time: 400)
            ])
        case .last:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "1", color: .red, time: 100),
                MarbleElementType(value: "2", color: .blue, time: 200),
                MarbleElementType(value: "3", color: .blue, time: 300),
                MarbleElementType(value: "4", color: .yellow, time: 400)
            ])
        case .first:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "1", color: .red, time: 100),
                MarbleElementType(value: "2", color: .blue, time: 200),
                MarbleElementType(value: "3", color: .blue, time: 300),
                MarbleElementType(value: "4", color: .yellow, time: 400)
            ])
        case .zip:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "1", color: .red, time: 100),
                MarbleElementType(value: "2", color: .blue, time: 400),
                MarbleElementType(value: "3", color: .orange, time: 800),
                ], line2: [
                    MarbleElementType(value: "A", color: .red, time: 200),
                    MarbleElementType(value: "B", color: .blue, time: 600),
            ])
        case .scan:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "1", color: .red, time: 100),
                MarbleElementType(value: "2", color: .blue, time: 200),
                MarbleElementType(value: "3", color: .green, time: 300),
                MarbleElementType(value: "4", color: .yellow, time: 400)
            ])
        case .flatMap:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "1", color: .red, time: 100),
                MarbleElementType(value: "2", color: .blue, time: 400),
                MarbleElementType(value: "3", color: .green, time: 700)
                ], line2: [
                    MarbleElementType(value: "1", color: .gray, time: 100, shape: .square),
                    MarbleElementType(value: "2", color: .gray, time: 200, shape: .square)])
        case .min:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "300", color: .red, time: 100),
                MarbleElementType(value: "5", color: .blue, time: 200),
                MarbleElementType(value: "55", color: .green, time: 300),
                MarbleElementType(value: "24", color: .yellow, time: 400)
            ])
        case .max:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "300", color: .red, time: 100),
                MarbleElementType(value: "5", color: .blue, time: 200),
                MarbleElementType(value: "55", color: .green, time: 300),
                MarbleElementType(value: "24", color: .yellow, time: 400)
            ])
        case .count:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "300", color: .red, time: 100),
                MarbleElementType(value: "5", color: .blue, time: 200),
                MarbleElementType(value: "55", color: .green, time: 300),
                MarbleElementType(value: "24", color: .yellow, time: 400)
            ])
        }
    }

    var endTime: CGFloat {
        return Swift.max(initial.line1.last?.time ?? 0, initial.line2?.last?.time ?? 0)
    }
    
    var transformText: String {
        switch self {
        case .map:
            return "map {$0 * 10}"
        case .collect:
            return "a.collect()"
        case .filter:
            return "a.filter {$0 > 10}"
        case .removeDuplicates:
            return "a.removeDuplicates()"
        case .merge:
            return "Publishers.merge(a, b)"
        case .append:
            return "a.append(b)"
        case .dropFirst:
            return "a.dropFirst(2)"
        case .last:
            return "a.last()"
        case .first:
            return "a.first()"
        case .zip:
            return "Publishers.zip(a, b)"
        case .scan:
            return "a.scan(0) {$0 + $1}"
        case .flatMap:
            return "a.flatMap(b)"
        case .min:
            return "a.min()"
        case .max:
            return "a.max()"
        case .count:
            return "a.count()"
        }
    }
    
    func transform() -> AnyPublisher<MarbleElementType, Never> {
        switch self {
        case .map:
            return initial.line1.publisher()
                .map { marble in
                    return MarbleElementType(value: "\(Int(marble.value)! * 10)",
                                             color: marble.color,
                                             time: marble.time)
            }.eraseToAnyPublisher()
        case .collect:
            return initial.line1.publisher()
                .collect()
                .map { collected in
                    let values = collected.map {$0.value}.joined(separator: ",")
                    return MarbleElementType(value: "[\(values)]",
                        color: .black,
                        time: endTime)
            }.eraseToAnyPublisher()
        case .filter:
            return initial.line1.publisher()
                .filter { Int($0.value)! > 10 }
                .eraseToAnyPublisher()
        case .removeDuplicates:
            return initial.line1.publisher()
                .removeDuplicatesByKeyPath(\.value)
                .eraseToAnyPublisher()
        case .merge:
            let sequence1 = initial.line1.publisher()
            let sequence2 = initial.line2!.publisher()

            return Publishers.Merge(sequence1, sequence2)
                .eraseToAnyPublisher()
        case .append:
            let sequence1 = initial.line1.publisher()
            let line1End = initial.line1.last!.time
            let sequence2 = initial.line2!.publisher()
                .map { (marble) in
                    MarbleElementType(value: marble.value, color: marble.color, time: marble.time + line1End, shape: marble.shape)
            }

            return sequence1
                .append(sequence2)
                .eraseToAnyPublisher()
        case .dropFirst:
            return Publishers.Sequence(sequence: initial.line1)
                .dropFirst(2)
                .eraseToAnyPublisher()
        case .last:
            return Publishers.Sequence(sequence: initial.line1)
                .last()
                .eraseToAnyPublisher()
        case .first:
            return initial.line1.publisher()
                .first()
                .eraseToAnyPublisher()
        case .zip:
            let sequence1 = initial.line1.publisher()
            let sequence2 = initial.line2!.publisher()
            return Publishers.Zip(sequence1, sequence2)
                .map {element1, element2 in
                    return MarbleElementType(value: element1.value + element2.value,
                                             color: .blue,
                                             time: element2.time)
            }.eraseToAnyPublisher()
        case .scan:
            return initial.line1.publisher()
                .scan(MarbleElementType(value: "0",
                                        color: .white,
                                        time: 0))
                { acc, e in
                    let a = Int(e.value)!
                    let b = Int(acc.value)!
                    return MarbleElementType(value: String(a + b),
                                             color: e.color,
                                             time: e.time)
            }.eraseToAnyPublisher()
        case .flatMap:
            let sequence1 = initial.line1.publisher()
            let sequence2 = initial.line2!.publisher()

            return sequence1
                .flatMap { e1 in
                    sequence2.map { e2 in
                        MarbleElementType(value: e2.value,
                                          color: e1.color,
                                          time: e2.time + e1.time - 100,
                                          shape: .square)
                    }
            }.eraseToAnyPublisher()
        case .min:
            let numberValues = initial.line1.map {Int($0.value)!}
            return numberValues.publisher()
                .min()
                .map { value in
                    let originalValue = initial.line1.first(where: {String(value) == $0.value})!
                    return MarbleElementType(value: originalValue.value,
                                             color: originalValue.color,
                                             time: endTime)
            }.eraseToAnyPublisher()
        case .max:
            let numberValues = initial.line1.map {Int($0.value)!}
            return numberValues.publisher()
                .max()
                .map { value in
                    let originalValue = initial.line1.first(where: {String(value) == $0.value})!
                    return MarbleElementType(value: originalValue.value,
                                             color: originalValue.color,
                                             time: endTime)
            }.eraseToAnyPublisher()
        case .count:
            let numberValues = initial.line1.map {Int($0.value)!}
            return numberValues.publisher()
                .count()
                .map { value in
                    return MarbleElementType(value: String(value),
                                             color: .yellow,
                                             time: endTime)
            }.eraseToAnyPublisher()
        }
    }
}

