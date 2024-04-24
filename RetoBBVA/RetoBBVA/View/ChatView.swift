//
//  ContentView.swift
//  RetoBBVA
//
//  Created by Alumno on 24/04/24.
//

import SwiftUI

struct ChatView: View {
    
    @StateObject private var apiModel = APIOpenAI()
   
    var body: some  View {
        
        NavigationView {
            
            VStack {
                
                Color.clear
                    .frame(height: 80)
                
                ScrollViewReader { sview in
                    ScrollView {
                        LazyVStack (spacing: 0) {
                            ForEach($apiModel.messages, id: \.id) { message in
                                MessageView(message: message)
                            }
                            
                            .onChange(of: apiModel.messages.count) { _ in
                                withAnimation{
                                    sview.scrollTo("bottom")
                                }
                                
                            }
                            
                            Color.clear
                                .frame(height: 1)
                                .id("bottom")
                        }
                    }.onReceive(apiModel.$messages.throttle(for: 0.5, scheduler: RunLoop.main, latest: true)) { chat in
                        guard !chat.isEmpty else {return}
                        withAnimation {
                            withAnimation{
                                sview.scrollTo("bottom")
                            }
                        }
                    }
                    .onAppear {
                        withAnimation{
                            sview.scrollTo("bottom")
                        }
                    }
                }
                
                
                HStack {
                    
                    TextField("Escribe...", text: $apiModel.newMessage, axis: .vertical)
                        .lineLimit(5)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray5))
                    
                    
                    Button(action: {
                        if (!apiModel.newMessage.isEmpty || apiModel.writting){
                            
                            sendMessage()
                            
                        }
                        
                    }) {
                        Image(systemName: "paperplane.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(apiModel.newMessage.isEmpty ?  Color(.systemGray3) :  Colors.primaryLight )
                    }
                    .padding(.horizontal, 10)
                }.padding()
                
                
                Color.clear
                    .frame(height: 150)
                
            }
            
        }
        .navigationBarHidden(true)
    }
    
        func sendMessage() {
            print("funcion1")
            Task {
                print("funcion2")
                do {
                    try await apiModel.sendMessage()
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }
                
}


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
