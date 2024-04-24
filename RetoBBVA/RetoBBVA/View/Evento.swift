//
//  Evento.swift
//  RetoBBVA
//
//  Created by Alumno on 24/04/24.
//

import SwiftUI

struct Evento: View {
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
                    valor(valor: "200", centavos: "30", tipoValor: "esperado")
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
                
                
                Button(action: {}){
                    CircleImage(icon: "plus", color: Color(hex: "64C9CC"))
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


#Preview {
    Evento()
}
