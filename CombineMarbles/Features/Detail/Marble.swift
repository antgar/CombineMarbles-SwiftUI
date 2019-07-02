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
                    .padding([.leading, .trailing])
                Group {
                    ForEach(self.values.identified(by: \.time)) {element in
                        self.makeMarbleView(offset: (geometry.size.width / self.maxTime) * element.time,
                                       element: element)
                    }
                }
                }.fixedSize()
            }.fixedSize(horizontal: false, vertical: true)
            .padding([.top,.bottom], 30)
    }
    
    private func makeMarbleView(offset: CGFloat, element: MarbleElementType) -> some View {
        
        switch element.shape {
        case .circle:
            return AnyView(CircleView(circleColor: element.color,
                       title: element.value)
                .modifier(ShapeModifier(offset: offset))
            )
        case .square:
            return AnyView(SquareView(circleColor: element.color,
                                      title: element.value)
                .modifier(ShapeModifier(offset: offset))
            )

        }
    }
}

#if DEBUG
struct Marble_Previews : PreviewProvider {
    static var previews: some View {
        MarbleView(values: Operator.flatMap.initial.line2!)
    }
}
#endif
