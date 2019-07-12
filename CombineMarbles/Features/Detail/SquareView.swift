//
//  TriangleView.swift
//  CombineMarbles
//
//  Created by Laurent Catalina on 01/07/2019.
//  Copyright © 2019 antgar. All rights reserved.
//

import SwiftUI

struct SquareView : View {
    private let width: CGFloat = 20
    let color: Color
    let title: String

    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        VStack(spacing: 2) {
            Text(title)
            Path(CGRect(x: 0, y: 0, width: width, height: width))
                .foregroundColor(color.modifiedForScheme(scheme))
                .frame(width: width, height: width, alignment: .center)
        }
        
    }
}

#if DEBUG
struct SquareView_Previews : PreviewProvider {
    static var previews: some View {
        SquareView(color: .red, title: "1")
    }
}
#endif
