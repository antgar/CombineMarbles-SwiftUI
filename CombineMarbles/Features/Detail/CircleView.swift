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
    var circleColor: Color
    var title: String
    var body: some View {
        VStack(spacing: 2) {
            Text(title)
            Path(ellipseIn: CGRect(x: 0,
                                   y: 0,
                                   width: width,
                                   height: width))
                .foregroundColor(circleColor)
                .frame(width: 20, height: 20, alignment: .center)
        }
    }
}

#if DEBUG
struct CircleView_Previews : PreviewProvider {
    static var previews: some View {
        CircleView(circleColor: Color.red, title: "1")
    }
}
#endif
