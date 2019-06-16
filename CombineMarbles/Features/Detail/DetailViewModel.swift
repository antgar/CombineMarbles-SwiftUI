//
//  DetailViewModel.swift
//  CombineMarbles
//
//  Created by Antoine Garcia on 13/06/2019.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class DetailViewModel: BindableObject {
    let didChange: AnyPublisher<DetailViewModel, Never>
    private let _didChange = PassthroughSubject<DetailViewModel, Never>()
    
    let initialValues: [MarbleElementType]
    let text: String
    var result: [MarbleElementType] = [] {
        didSet {
            _didChange.send(self)
        }
    }
    private(set) var title = "" {
        didSet {
            _didChange.send(self)
        }
    }
    init(currentOperator: Operator) {
        title = currentOperator.rawValue
        didChange = _didChange.eraseToAnyPublisher()
        initialValues = currentOperator.initial.line1
        text = currentOperator.transformText
        _ = currentOperator.transform()
            .sink(receiveValue: { value in
                self.result.append(value)
            })
    }
}
