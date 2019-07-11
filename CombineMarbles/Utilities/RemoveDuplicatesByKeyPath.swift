//
//  RemoveDuplicatesByKeyPath.swift
//  CombineMarbles
//
//  Created by Andrew Fitzpatrick on 7/11/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import Combine

extension Publishers {
    struct RemoveDuplicatesByKeyPath<Upstream: Publisher, EquatableValue: Equatable>: Publisher {

        private struct EquatableKeyPathWrapper<Subject, Value: Equatable>: Equatable {

            let subject: Subject
            let keyPath: KeyPath<Subject, Value>

            var value: Value {
                subject[keyPath: keyPath]
            }

            static func == (lhs: Self, rhs: Self) -> Bool {
                return lhs.value == rhs.value
            }
        }

        typealias Output = Upstream.Output
        typealias Failure = Upstream.Failure

        let upstream: Upstream
        let keyPath: KeyPath<Output, EquatableValue>

        init(upstream: Upstream, keyPath: KeyPath<Output, EquatableValue>) {
            self.upstream = upstream
            self.keyPath = keyPath
        }

        func receive<S: Subscriber>(subscriber: S) where Failure == S.Failure, Output == S.Input {
            upstream
                .map { EquatableKeyPathWrapper(subject: $0, keyPath: self.keyPath) }
                .removeDuplicates()
                .map { $0.subject }
                .receive(subscriber: subscriber)
        }
    }
}

extension Publisher {
    func removeDuplicatesByKeyPath<T: Equatable>(_ path: KeyPath<Output, T>) -> AnyPublisher<Output, Failure> {
        Publishers.RemoveDuplicatesByKeyPath(upstream: self, keyPath: path).eraseToAnyPublisher()
    }
}

