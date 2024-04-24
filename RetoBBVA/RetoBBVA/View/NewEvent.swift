//
//  NewEvent.swift
//  RetoBBVA
//
//  Created by Alumno on 24/04/24.
//

import SwiftUI

struct NewEvent: View {
    @State private var evento: String = ""
    @State private var inicio = Date()
    @State private var fin = Date()
    
    var body: some View {
        VStack {
            
            VStack(alignment: .center, spacing: 20){
                ZStack{
                    Color(hex: "1a437d")
                        .ignoresSafeArea(.all)
                    
                    VStack {
                        Text("Crear evento")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 22, weight: .regular))
                    }
                }
                .frame(height: 60)
                
                TextField("Nombre del Evento", text: $evento)
                                        .padding()
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(2)
                                        .padding(.horizontal, 30)
                VStack(spacing: 20){
                    DatePicker(
                            "Fecha de inicio",
                            selection: $inicio,
                            displayedComponents: [.date]
                        )
                    DatePicker(
                            "Fecha de fin",
                            selection: $fin,
                            displayedComponents: [.date]
                        )
                }.frame(width: 320)

            }
            Spacer()
                .frame(height: 40)
            
            ScrollView {
                
                VStack {
                    HStack{
                        Text("INTEGRANTES")
                            .font(.system(size: 17, weight: .bold))
                        Spacer()
                        
                    }
                    .padding(.horizontal, 35)
                    Spacer()
                        .frame(height: 20)
                    
                    HStack{
                        HStack {
                            
                            Button(action: {
                                // Acción al presionar el botón
                            }) {
                                Image(systemName: "plus")
                                    .font(.title)
                                    .foregroundColor(Color.white)
                                    .frame(width: 50, height: 50)
                                    .background(Color(hex: "64c9cc"))
                                    .clipShape(Circle())
                                
                                Text("Nuevo")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundStyle(Color(hex: "64c9cc"))
                            }

                        }
                        Spacer()
                    }
                    .frame(width: 350)
                }
                Spacer()
                    .frame(height: 20)

                
                
                
                VStack {
                    HStack{
                        Text("GUARDADOS")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(Color.gray)
                        Spacer()
                        Text("Ver todos")
                            .foregroundStyle(Color(hex: "1a437d"))
                            .font(.system(size: 16, weight: .bold))
                        
                    }
                    .padding(.horizontal, 35)
                    Spacer()
                        .frame(height: 20)
                    
                    
                    HStack{
                        HStack {
                            Button(action: {
                                // Acción al presionar el botón
                            }) {
                                HStack {
                                    Image(systemName: "person.fill")
                                        .font(.title)
                                        .foregroundColor(Color.white)
                                        .frame(width: 50, height: 50)
                                        .background(Color(hex: "9381FF"))
                                        .clipShape(Circle())
                                    Spacer()
                                        .frame(width: 15)
                                    VStack(alignment: .leading) {
                                        Text("Cristina Hdz")
                                            .font(.system(size: 18, weight: .medium))
                                            .foregroundStyle(Color.black)
                                        
                                        Text("Cristina H P")
                                            .font(.system(size: 16, weight: .light))
                                            .textCase(.uppercase)
                                            .foregroundStyle(Color.black)
                                        Spacer()
                                            .frame(height: 10)
                                        Text("Cuenta BBVA")
                                            .font(.system(size: 16, weight: .light))
                                            .foregroundStyle(Color.gray)
                                        Text("1234 5678 9123 4567 8910")
                                            .font(.system(size: 16, weight: .light))
                                            .foregroundStyle(Color.black)
                                    }
                                }
                                
                                

                            }
                            
                            
                        }
                        Spacer()
                    }
                    .frame(width: 350)
                }
                
                
                
                
                
                
            }
            
            
            Spacer()
                
        }
            
    }
    
}

#Preview {
    NewEvent()
}
