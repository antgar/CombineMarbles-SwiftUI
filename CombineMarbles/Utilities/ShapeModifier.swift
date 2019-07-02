//
//  ShapeModifier.swift
//  CombineMarbles
//
//  Created by Laurent Catalina on 02/07/2019.
//  Copyright © 2019 antgar. All rights reserved.
//

import SwiftUI

struct ShapeModifier: ViewModifier {
    let offset: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding(.bottom, 20)
            .offset(x: offset)
    }
}
