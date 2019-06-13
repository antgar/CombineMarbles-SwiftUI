//
//  OperatorsListView.swift
//  CombineMarbles
//
//  Created by Antoine Garcia on 10/06/2019.
//  Copyright © 2019 antgar. All rights reserved.
//

import SwiftUI

struct OperatorsListView : View {
    @ObjectBinding var viewModel: OperatorsListViewModel
    var body: some View {
        NavigationView {
            OperatorList(sections: viewModel.operators)
        }
    }
}

struct OperatorList: View {
    var sections: [OperatorSection]
    
    var body: some View {
        List {
            ForEach(sections.identified(by: \.title)) {section in
                Section(header: Text(section.title)) {
                    ForEach(section.operators.identified(by: \.self)) {currentOperator in
                        NavigationButton(destination: DetailView(viewModel: DetailViewModel(currentOperator: currentOperator))) {
                                OperatorRow(currentOperator)
                        }
                    }
                }
            }
        }.navigationBarTitle(Text("Operators"))
    }
}

#if DEBUG
struct OperatorsListView_Previews : PreviewProvider {
    static var previews: some View {
        OperatorsListView(viewModel: OperatorsListViewModel())
    }
}
#endif
