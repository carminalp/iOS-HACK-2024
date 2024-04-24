//
//  Evento.swift
//  RetoBBVA
//
//  Created by Alumno on 24/04/24.
//

import SwiftUI

struct Event: View {
    var body: some View {
        
        VStack {
            VStack(alignment: .center, spacing: 20){
                ZStack{
                    Color(hex: "1a437d")
                        .ignoresSafeArea(.all)
                    
                    VStack {
                        Text("Evento")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 22, weight: .regular))
                    }
                }
                .frame(height: 60)
            }
            Spacer()
                .frame(height: 20)
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    VStack {
                        Text("Viaje a Huatulco") /// CAMBIAR EL TEXTO AL NOMBRE DEL EVENTO
                            .foregroundStyle(Color.black)
                            .font(.system(size: 20, weight: .regular))
                        Spacer()
                            .frame(height: 10)
                            Text("Enero 20, 2024")
                                .foregroundStyle(Color.gray)
                            Text("Febrero 24, 2024")
                                .foregroundStyle(Color.gray)
                    }
                    
                    
                    VStack {
                        valor(valor: "100", centavos: "47", tipoValor: "real")
                        Spacer()
                            .frame(height: 20)
                        valor(valor: "200", centavos: "30", tipoValor: "estimado")
                        Spacer()
                            .frame(height: 30)
                        integranteDeudor(personName: "Alberto", quantity: "100")
                        integranteDeudor(personName: "Carmina", quantity: "200")
                    
                        
                    }

                    Button(action:{
                        
                    }){
                        Text("Calcular gastos")
                            .foregroundColor(Color.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 13)
                            .font(.system(size: 17, weight: .bold))
                            .background(Color(hex: "2768b3"))
                    }
                    
                    
                    VStack {
                        HStack{
                            Text("Fecha")
                                .font(.system(size: 16, weight: .light))
                                .foregroundStyle(Color.black)
                            Spacer()
                            Text("Gasto")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundStyle(Color.black)
                            Spacer()
                            Text("Valor")
                                .font(.system(size: 16, weight: .light))
                                .foregroundStyle(Color.black)
                        }
                        Spacer()
                            .frame(height: 10)
                        expenses(expenseName: "Hotel", value: "5643", date: "18-02-2024")
                        expenses(expenseName: "Comida", value: "7643", date: "18-02-2024")
                        expenses(expenseName: "Vuelos", value: "16043", date: "18-02-2024")
                        expenses(expenseName: "Ropa", value: "1423", date: "18-02-2024")
                    }.padding(.horizontal,50)
                    
                    
                    
                    Button(action: {}){
                        CircleImage(icon: "plus", color: Color(hex: "64C9CC"))
                    }
                    
                }
            }
            Spacer()
        }
        
    }
}

struct valor: View {
    let valor: String
    let centavos: String
    let tipoValor: String
    
    var body: some View {
        
        HStack(spacing: 1){
            Text("$")
            Text("\(valor)")
                .foregroundStyle(Color.black)
                .font(.system(size: 38, weight: .light))
            Text("\(centavos)")
        }
        Text("Valor \(tipoValor)")
            .foregroundStyle(Color.gray)
            .font(.system(size: 18, weight: .light))
    }
}




struct integranteDeudor: View {
    
    let personName: String
    let quantity: String
    
    var body: some View {
        HStack {
            Text("\(personName) debe: $\(quantity)")
                .font(.system(size: 18, weight: .light))
        }
    }
}

struct expenses: View {
    let expenseName: String
    let value: String
    let date: String

    
    var body: some View {

        HStack {
            Text(date)
                .font(.system(size: 16, weight: .light))
                .foregroundStyle(Color.black)
            Spacer()
                .frame(width: 40)
            Text(expenseName)
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(Color.black)
            Spacer()
            Text("$\(value)")
                .font(.system(size: 16, weight: .light))
                .foregroundStyle(Color.black)
        }
    
        
    }
}



#Preview {
    Event()
}
