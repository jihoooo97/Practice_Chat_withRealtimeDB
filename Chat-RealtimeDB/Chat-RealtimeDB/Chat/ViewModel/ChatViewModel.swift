//
//  ChatViewModel.swift
//  LightOnOff
//
//  Created by 유지호 on 3/5/24.
//

import Combine
import Firebase

class ChatViewModel: ObservableObject {
    @Published var chatList: [MessageModel] = []
    @Published var chattingText: String = ""
    
    private let databaseRef = Database.database().reference()
    
    // 임의로 지정한 아이디
    let userID = "1"
    
    init() {
        observeState()
    }
    
    func sendMessage() {
        guard !chattingText.isEmpty else { return }
        
        let message = MessageModel(
            senderID: self.userID,
            date: Date().formatted(),
            message: chattingText
        )
        
        chatList.append(message)
        
        do {
            guard let data = try? JSONEncoder().encode(chatList),
                  let dictionary = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]]
            else {
                throw ChatError.encodingError
            }
            
            databaseRef.child("chattingList").setValue(dictionary)
            chattingText = ""
        } catch {
            
        }
    }
    
    func observeState() {
        databaseRef.child("chattingList").observe(.value) { [weak self] snapshot in
            guard let value = snapshot.value as? [[String: Any]]
            else {
                print("snapshot error")
                return
            }

            do {
                let data = try JSONSerialization.data(withJSONObject: value)
                let response = try JSONDecoder().decode([MessageModel].self, from: data)
                
                self?.chatList = response
            } catch {
                print("decoding error")
            }
        }
    }
}
