//
//  Marble.swift
//  CombineMarbles
//
//  Created by Antoine Garcia on 13/06/2019.
//  Copyright © 2019 antgar. All rights reserved.
//

import SwiftUI

struct MarbleView: View {
    let values: [MarbleElementType]
    var body: some View {
        ZStack(alignment: .leading) {
            TimelineView()
            HStack {
                ForEach(values.identified(by: \.value)) {element in
                    CircleView(circleColor: element.color, title: element.value)
                        .padding([.bottom, .leading], 20)
                }
            }
        }
    }
}

#if DEBUG
struct Marble_Previews : PreviewProvider {
    static var previews: some View {
        MarbleView(values: Operator.map.initial.line1)
    }
}
#endif
