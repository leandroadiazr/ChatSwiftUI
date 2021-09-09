//
//  StatusSelectorView.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/8/21.
//

import SwiftUI

struct StatusSelectorView: View {
    @ObservedObject var viewModel = StatusChanged()
    
    
//    @State private var selectedStatus: StatusViewModel = .notConfigured
    
    var body: some View {
        ZStack {
            Color(.systemGray5)
                .edgesIgnoringSafeArea(.all)
            
            //MainVstack
            VStack(alignment: .leading, spacing: 30) {
                
                VStack {
                    Text("Currently Set To:")
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color(.lightGray))
                }
                .padding()
                
                //MARK:- SELECTED STATUS
                StatusCell(status: viewModel.status)
                
                //MARK:- Status Options
                
                VStack {
                    Text("Select Your Status")
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color(.lightGray))
                }
                .padding(.horizontal)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        
                        //ForEach loop from the status Enum
                        ForEach(StatusViewModel.allCases.filter({$0 != .notConfigured}), id: \.self) { index in
                            
                            Button(action: {
                                viewModel.updateStatus(index)
//                                StatusCell(status: viewModel.status)
//                                selectedStatus = index
                            }, label: {
                                StatusCell(status: index)
//                                Text(index.title)
//                                    .bold()
                                    .padding()
                                Spacer()
                            })
                            .foregroundColor(.black)
                            Divider()
                                .padding(0)
                                .background(Color.green)
                        }
                    }
//                    .padding(2)
                    .background(Color.white)
                }
            }
        }
    }
}

struct StatusSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        StatusSelectorView()
    }
}

struct StatusCell: View {
    let status: StatusViewModel
    
    var body: some View {
        HStack{
            Text(status.title)
                .bold()
                .font(.title3)
            Spacer()
        }
        .padding(6)
        .background(Color.white)
    }
}
