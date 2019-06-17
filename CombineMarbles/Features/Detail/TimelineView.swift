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
        GeometryReader {geometry in
            Path(CGRect(x: 0,
                        y: 0,
                        width: geometry.size.width,
                        height: 1))
        }.padding()
        .frame(height: 1)
    }
}

#if DEBUG
struct timelineView_Previews : PreviewProvider {
    static var previews: some View {
        TimelineView()
    }
}
#endif
