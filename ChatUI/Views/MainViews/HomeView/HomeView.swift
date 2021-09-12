//
//  HomeView.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/7/21.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    @State private var showNewMessageView = false
    @State private var showChatView = false
    //    @Binding var searchMessage: String
    
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color(.systemGray5)
                .edgesIgnoringSafeArea(.all)
            
            
            NavigationLink(
                destination: ChatView(),
                isActive: $showChatView,
                label: {  })
            
            
            
            ScrollView {
                VStack(alignment: .leading) {
                    
                    ForEach(0 ... 20, id: \.self) { conversation in
                        HStack {
                            ConversationCell(userName: "leandro a diaz", message: "this is just a message")
                            Spacer()
                        }
                        .padding(6)
                        Divider()
                            .background(Color.red)
                    }
                    
                }
                .padding(.top, 20)
                Spacer()
            }
            
            
            
            //MARK:-Floting Button
            HStack {
                Spacer()
                Button(action: {
                    showNewMessageView.toggle()
                }, label: {
                    Image(systemName: "square.and.pencil")
                })
                .frame(width: 44, height: 44)
                .background(Color.blue)
                .clipShape(Circle())
                .foregroundColor(.white)
                .padding()
                .sheet(isPresented: $showNewMessageView, content: {
                    NewMessagesView(showChatView: $showChatView)
                })
            }
            .padding()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
