//
//  AddExpense.swift
//  RetoBBVA
//
//  Created by Alumno on 24/04/24.
//

import SwiftUI

struct AddExpense: View {
    @State private var expenseName: String = ""
    @State private var expensePrice: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            
            VStack(alignment: .center, spacing: 20){
                ZStack{
                    Color(hex: "1a437d")
                        .ignoresSafeArea(.all)
                    
                    VStack {
                        Text("Crear Gasto")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 22, weight: .regular))
                    }
                }
                .frame(height: 60)
                
                TextField("Nombre del gasto", text: $expenseName)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(2)
                    .padding(.horizontal, 30)
                
                TextField("Importe", text: $expensePrice)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(2)
                    .padding(.horizontal, 30)
                
                Text("Ticket")
                NavigationLink(destination: TicketView()){
                    Text("Leer ticket")
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 13)
                        .font(.system(size: 17, weight: .bold))
                        .background(Color(hex: "64C9CC"))
                }
            
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("Agregar")
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 13)
                        .font(.system(size: 17, weight: .bold))
                        .background(Color(hex: "2768b3"))
                }
                
                
            }
            Spacer()
            
        }
    }
}

#Preview {
    AddExpense()
}
