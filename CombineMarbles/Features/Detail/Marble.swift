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
    private let maxTime: CGFloat = 1000.0
    var body: some View {
        GeometryReader {geometry in
        ZStack(alignment: .leading) {
                TimelineView()
                HStack {
                    ForEach(self.values.identified(by: \.value)) {element in
                        CircleView(circleColor: element.color, title: element.value)
                            .padding(.bottom, 20)
                            .offset(x: (geometry.size.width / self.maxTime) * element.time)
                    }
                }
            }.fixedSize()
        }.fixedSize(horizontal: false, vertical: true)
        .padding([.top,.bottom], 30)
    }
}

#if DEBUG
struct Marble_Previews : PreviewProvider {
    static var previews: some View {
        MarbleView(values: Operator.map.initial.line1)
    }
}
#endif
