//
//  Color+ColorScheme.swift
//  CombineMarbles
//
//  Created by Andrew Fitzpatrick on 7/11/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import SwiftUI

extension Color {
    func modifiedForScheme(_ scheme: ColorScheme) -> Color {
        if scheme == .dark {
            switch self {
            case .black:
                return .white
            case .white:
                return .black
            default:
                return self
            }
        } else {
            return self
        }
    }
}
