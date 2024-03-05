//
//  MessageView.swift
//  LightOnOff
//
//  Created by 유지호 on 3/5/24.
//

import SwiftUI

struct MessageView: View {
    let messageModel: MessageModel
    let isMe: Bool
    
    var body: some View {
        HStack(alignment: .top) {
            if isMe {
                Spacer()
            }
            
            if !isMe {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.blue)
                    .frame(width: 30 ,height: 30)
                    .overlay {
                        Image(systemName: "person.fill")
                            .foregroundStyle(.white)
                    }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                if !isMe {
                    Text(setNickName(senderID: messageModel.senderID))
                        .padding(.bottom, 4)
                }
                
                Text(messageModel.message)
                    .foregroundStyle(.white)
                    .padding(8)
                    .background(isMe ? .blue : .gray)
                    .clipShape(RoundedRectangle(cornerRadius: 8))

            }
            
            if !isMe {
                Spacer()
            }
        }
    }
    
    func setNickName(senderID: String) -> String {
        switch senderID {
        case "0": return "냥냥펀치"
        case "1": return "Steve"
        case "2": return "MacBook M3 Pro"
        default:  return "MacBooK Pro M3 Pro"
        }
    }
}

#Preview {
    MessageView(
        messageModel: .init(senderID: "냥냥펀치", date: Date().formatted(), message: "안녕하세요"),
        isMe: false
    )
}
