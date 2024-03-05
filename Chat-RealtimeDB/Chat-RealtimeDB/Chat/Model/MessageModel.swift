//
//  MessageModel.swift
//  LightOnOff
//
//  Created by 유지호 on 3/5/24.
//

import Foundation

struct MessageModel: Identifiable, Codable {
    var id: String = UUID().uuidString
    let senderID: String
    var date: String
    var message: String
}
