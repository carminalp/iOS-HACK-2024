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
    @State private var integrantesSeleccionados: [String] = []
    @State private var navigateToEvent = false
    
    func crearEvento() {
        // Convertir las fechas a string
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let inicioString = formatter.string(from: inicio)
        let finString = formatter.string(from: fin)
        
        // Imprimir la información
        print("Nombre del evento:", evento)
        print("Fecha de inicio:", inicioString)
        print("Fecha de fin:", finString)
        print("Integrantes seleccionados:", integrantesSeleccionados)
    }
    
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
                    
                    
                    VStack(alignment: .trailing, spacing: 20){
                        PersonButton(personName: "Mariana S", accountType: "Mariana S R", accountNumber: "1234 5678 9123 4567 8910", imgColor: "9381FF", integrantesSeleccionados: $integrantesSeleccionados) {
                            // Acción al presionar el botón para Cristina Hdz
                            print("Se ha presionado el botón de Mariana S")
                        }
                        Divider()
                        PersonButton(personName: "Cristina Hdz", accountType: "Cristina H P", accountNumber: "5678 9123 4567 8910 1234", imgColor: "FFC43D", integrantesSeleccionados: $integrantesSeleccionados) {
                            // Acción al presionar el botón para Cristina Hdz
                            print("Se ha presionado el botón de Cristina Hdz")
                        }
                        Divider()
                        PersonButton(personName: "Carmina L", accountType: "Carmina L P", accountNumber: "1234 5678 9123 8910 4567", imgColor: "64C9CC", integrantesSeleccionados: $integrantesSeleccionados) {
                            // Acción al presionar el botón para Cristina Hdz
                            print("Se ha presionado el botón de Carmina L")
                        }
                        Divider()
                        PersonButton(personName: "Jorge L", accountType: "Jorge L M", accountNumber: "1234 5678  4567 8910 9123", imgColor: "CF5C36", integrantesSeleccionados: $integrantesSeleccionados) {
                            // Acción al presionar el botón para Cristina Hdz
                            print("Se ha presionado el botón de Jorge L")
                        }
                        Divider()
                        PersonButton(personName: "Aaron I", accountType: "Aaron I I", accountNumber: "4567 1234 5678 9123 8910", imgColor: "E6CCBE", integrantesSeleccionados: $integrantesSeleccionados) {
                            // Acción al presionar el botón para Cristina Hdz
                            print("Se ha presionado el botón de Aaron I")
                        }
                        Divider()
                        
                    }
                    .padding(.horizontal, 40)
                    
                    
                }
                Spacer()
                    .frame(height: 40)
                
                Button(action:{
                    crearEvento()
                    self.navigateToEvent = true
                    
                }){
                    Text("Crear evento")
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 13)
                        .font(.system(size: 17, weight: .bold))
                        .background(Color(hex: "2768b3"))
                }
                NavigationLink(destination: Event(), isActive: $navigateToEvent) {
                                EmptyView()
                }
                
                
                
            }
            
            
            Spacer()
                
        }
            
    }
    
}


struct PersonButton: View {
    let personName: String
    let accountType: String
    let accountNumber: String
    let imgColor: String
    @Binding var integrantesSeleccionados: [String]
    let action: () -> Void
    
    @State private var isPressed = false

    
    var body: some View {
        HStack {
            Button(action: {
                self.isPressed = true
                self.integrantesSeleccionados.append(personName)
                self.action()
                
            }) {
                HStack {
                    Image(systemName: "person.fill")
                        .font(.title)
                        .foregroundColor(Color.white)
                        .frame(width: 50, height: 50)
                        .background(Color(hex: imgColor))
                        .clipShape(Circle())
                    Spacer()
                        .frame(width: 15)
                    VStack(alignment: .leading) {
                        Text(personName)
                            .font(.system(size: 18, weight: .medium))
                            .foregroundStyle(Color.black)
                        
                        Text(accountType)
                            .font(.system(size: 16, weight: .light))
                            .textCase(.uppercase)
                            .foregroundStyle(Color.black)
                        Spacer()
                            .frame(height: 10)
                        Text("Cuenta BBVA")
                            .font(.system(size: 16, weight: .light))
                            .foregroundStyle(Color.gray)
                        Text(accountNumber)
                            .font(.system(size: 16, weight: .light))
                            .foregroundStyle(Color.black)
                    }
                }
            }
            .background(isPressed ? Color(hex: "ebebeb") :Color.white)
            .disabled(isPressed)
            Spacer()
        }
        
    }
}




#Preview {
    NewEvent()
}
