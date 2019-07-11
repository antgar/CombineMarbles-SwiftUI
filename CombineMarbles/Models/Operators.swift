//
//  Operators.swift
//  CombineMarbles
//
//  Created by Antoine Garcia on 10/06/2019.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import SwiftUI

enum Operator: String {
    case map
    case collect
    case filter
    case removeDuplicates
    case merge
    case append
    case dropFirst
    case last
    case first
    case zip
    case scan
    case flatMap
    case min
    case max
    case count
}

extension Operator {
    var description: String {
        switch self {

        case .map:
            return "Applies a transformation to each element in a stream."
        case .collect:
            return "Waits until a stream is finished, then publishes all its elements in an array."
        case .filter:
            return "Only forwards elements that satisfy the given condition."
        case .removeDuplicates:
            return "Removes elements from the stream that match the previous element."
        case .merge:
            return "Publishes elements from two (or more) streams as a single stream."
        case .append:
            return "Publishes all elements from the first stream, then publishes from the second stream."
        case .dropFirst:
            return "Skips the first N elements in a stream."
        case .last:
            return "Publishes the final element of a stream on completion."
        case .first:
            return "Publishes the first element of a stream, then finishes."
        case .zip:
            return "Combines every element from each stream into tuples."
        case .scan:
            return "Reduces the elements of the stream, publishing each partial result."
        case .flatMap:
            return "Generates a new publisher for each element of a stream."
        case .min:
            return "Upon completion, publishes the lowest value in the stream."
        case .max:
            return "Upon completion, publishes the greatest value in the stream."
        case .count:
            return "Upon completion, publishes the total number of values it received."
        }
    }
}
