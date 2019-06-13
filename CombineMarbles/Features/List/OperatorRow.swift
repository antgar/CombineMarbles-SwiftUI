//
//  OperatorRow.swift
//  CombineMarbles
//
//  Created by Antoine Garcia on 13/06/2019.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import SwiftUI

struct OperatorRow: View {
    let currentOperator: Operator
    
    init(_ currentOperator: Operator) {
        self.currentOperator = currentOperator
    }
    
    var body: some View {
        Text(currentOperator.rawValue)
    }
}
