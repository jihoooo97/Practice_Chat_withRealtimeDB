//
//  ChatView.swift
//  LightOnOff
//
//  Created by 유지호 on 3/5/24.
//

import SwiftUI
import Firebase

struct ChatView: View {

    @StateObject private var viewModel = ChatViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.chatList) { chat in
                        MessageView(
                            messageModel: chat,
                            isMe: viewModel.userID == chat.senderID
                        )
                    }
                }
                .padding(.horizontal, 16)
            }
            
            HStack {
                HStack {
                    TextField("", text: $viewModel.chattingText)
                        .frame(alignment: .center)
                        .padding(.leading, 10)
                    
                    Button {
                        viewModel.sendMessage()
                    } label: {
                        Image(systemName: "arrow.up")
                            .resizable()
                            .frame(width: 10, height: 15)
                    }
                    .frame(width: 24, height: 24)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(Circle())
                    .padding(.trailing, 4)
                }
                .frame(height: 36)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.gray, lineWidth: 0.5)
                }
            }
            .padding(.horizontal, 16)
        }
        .padding(.vertical, 1)
    }

}


#Preview {
    ChatView()
}
