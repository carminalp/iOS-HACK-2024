//
//  Message.swift
//  RetoBBVA
//
//  Created by Alumno on 24/04/24.
//

import Foundation

enum sender {
    case user
    case bot
}

struct Message: Identifiable {
    var id = UUID().uuidString
    var type: sender
    var messageBody: String
    var time: Date
    
    init(type: sender, messageBody: String){
        self.type = type
        self.messageBody = messageBody
        self.time = Date()
    }
}
