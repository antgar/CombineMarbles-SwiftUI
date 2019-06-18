//
//  timelineView.swift
//  CombineMarbles
//
//  Created by Antoine Garcia on 13/06/2019.
//  Copyright © 2019 antgar. All rights reserved.
//

import SwiftUI

struct TimelineView : View {
    var body: some View {
        GeometryReader { geometry in
            self.addLineWithArrow(size: geometry.size)
        }.padding(.trailing, 10)
        .frame(height: 1)
    }
}

extension TimelineView {
    func addLineWithArrow(size: CGSize) -> Path {
        var p = Path(CGRect(x: 0,
                            y: 0,
                            width: size.width,
                            height: 1))
        
        p.move(to: CGPoint(x: size.width+10, y: 0.5))
        p.addLine(to: CGPoint(x: size.width, y: -4))
        p.addLine(to: CGPoint(x: size.width, y: 5))
        
        return p
    }
}

#if DEBUG
struct timelineView_Previews : PreviewProvider {
    static var previews: some View {
        TimelineView()
    }
}
#endif
