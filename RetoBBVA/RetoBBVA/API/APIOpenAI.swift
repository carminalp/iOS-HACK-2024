//
//  APIOpenAI.swift
//  RetoBBVA
//
//  Created by Alumno on 24/04/24.
//

import SwiftUI
import ChatGPTSwift

@MainActor
class APIOpenAI: ObservableObject {
    
    let API = ChatGPTAPI(apiKey: api.key)
    @Published var writting = false
    //@Published var messages = testchat
    
    @Published var messages = [
        Message(type: .bot, messageBody: "Hola \(apiConfig.username).  \nSoy \(apiConfig.friendname), ¿Cómo va todo?")
     ]
    @Published var newMessage : String = ""
    
    func sendMessage() async throws {
        
        print("funcion")
        print(newMessage)
        
        messages.append(Message(type: .user, messageBody: newMessage))
        
        
       
        
        writting = true
    
        let aMessage = Message(type: .bot, messageBody: "")
        DispatchQueue.main.async {
            self.messages.append(aMessage)
        }
        let response = try await API.sendMessageStream(text: newMessage,
                                                       systemText: "Eres asistente virtual especializado experto en BBVA que tiene como proposito ayudar, educar e informar de manera fácil de entender (a veces usando ejemplos), los usuarios jovenes de 18-25 años acerca de su salud financiera y que esta les permita estar más informados y tomar una buena decisión. El usuario se llama \"\(apiConfig.username)\", tú te llamas \"\(apiConfig.friendname)\" y ya no tienes que saludarlo al inicio",
                                                       temperature: 0.5)
        
        
        newMessage = ""
        for try await stream in response {
            print(stream)
            if let last = messages.last {
                let curr = last.messageBody
                let new = curr + stream
                messages[messages.count-1].messageBody = new
                print(messages[messages.count-1])
                
            }
        }
        
        
        writting = false
        
        
        
        
        
    }
    
}


