//
//  DetailView.swift
//  CombineMarbles
//
//  Created by Antoine Garcia on 13/06/2019.
//  Copyright © 2019 antgar. All rights reserved.
//

import SwiftUI

struct DetailView : View {
    @ObjectBinding var viewModel: DetailViewModel
    var body: some View {
        VStack(alignment: .center) {
            MarbleView(values: viewModel.initialValues)
            if viewModel.initialValuesSecond != nil {
                MarbleView(values: viewModel.initialValuesSecond!)
            }
            Text(viewModel.text)
                .font(.largeTitle)
            MarbleView(values: viewModel.result)
        }.navigationBarTitle(Text(viewModel.title))
    }
}

#if DEBUG
struct DetailView_Previews : PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(currentOperator: .map))
    }
}
#endif
