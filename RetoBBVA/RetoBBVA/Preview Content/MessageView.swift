//
//  MessageView.swift
//  RetoBBVA
//
//  Created by Alumno on 24/04/24.
//

import SwiftUI


struct MessageView: View {
    
    @Binding var message: Message
    
    let dateFormatter: DateFormatter = {
        let format = DateFormatter()
        format.dateFormat = "dd/MM/yyyy HH:mm"
        return format
    }()
    
    
    var body: some View {
    
        HStack (alignment: .bottom){
            
            if(message.type == .bot) {
                Image("Assistant")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .padding(.bottom, 22)
            } else {
                Spacer(minLength: 40)
            }
            
            VStack (alignment: message.type == .bot ? .leading : .trailing){
                
                Text(message.messageBody).padding(15)
                    .foregroundColor(.white)
                    .background(message.type == .bot ? Colors.primaryDark : Colors.primaryLight)
                    .cornerRadius(10)
                    
            
                Text(dateFormatter.string(from: message.time)).font(.caption).foregroundColor(.gray)
                
            }
           
            if(message.type == .user) {
                
                Image("User")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35)
                    .clipShape(Circle())
                    .padding(.bottom, 20)
            } else {
                Spacer(minLength: 40)
            }
            
            
        }.padding(20)
        
    }
}

var testmessage2 = Message(type: .bot,
        messageBody: "Hola amigx! Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec quam at velit finibus vehicula.")

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: .constant(testmessage2))
    }
}
