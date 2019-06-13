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
    init(currentOperator: Operator) {
        didChange = _didChange.eraseToAnyPublisher()
        initialValues = currentOperator.initial.line1
        text = currentOperator.transformText
        _ = currentOperator.transform()
            .map {values in
                values.enumerated().map {[unowned self] (index, element) in
                    return MarbleElementType(value: String(element),
                                             color: self.initialValues[index].color)
                }
            }.sink {[unowned self] elements in
                self.result = elements
        }
    }
}
