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
    let didChange = PassthroughSubject<DetailViewModel, Never>()

    let initialValues: [MarbleElementType]
    let initialValuesSecond: [MarbleElementType]?
    let text: String

    let description: String

    var result: [MarbleElementType] = [] {
        didSet {
            didChange.send(self)
        }
    }

    private(set) var title = "" {
        didSet {
            didChange.send(self)
        }
    }
    
    init(currentOperator: Operator) {
        title = currentOperator.rawValue
        initialValues = currentOperator.initial.line1
        initialValuesSecond = currentOperator.initial.line2
        text = currentOperator.transformText
        description = currentOperator.description
        _ = currentOperator.transform()
            .collect()
            .sink { value in
                self.result = value
            }
    }
}
