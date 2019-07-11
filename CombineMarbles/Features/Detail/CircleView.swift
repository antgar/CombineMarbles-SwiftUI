//
//  CircleView.swift
//  CombineMarbles
//
//  Created by Antoine Garcia on 13/06/2019.
//  Copyright © 2019 antgar. All rights reserved.
//

import SwiftUI

struct CircleView : View {
    private let width: CGFloat = 20
    var color: Color
    var title: String

    @Environment(\.colorScheme) var scheme

    var body: some View {
        VStack(spacing: 2) {
            Text(title)
            Path(ellipseIn: CGRect(x: 0,
                                   y: 0,
                                   width: width,
                                   height: width))
                .foregroundColor(color.modifiedForScheme(scheme))
                .frame(width: 20, height: 20, alignment: .center)
        }
    }
}

#if DEBUG
struct CircleView_Previews : PreviewProvider {
    static var previews: some View {
        CircleView(color: Color.red, title: "1")
    }
}
#endif
