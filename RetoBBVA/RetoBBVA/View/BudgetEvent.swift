//
//  BudgetEvent.swift
//  RetoBBVA
//
//  Created by Alumno on 24/04/24.
//
import SwiftUI
import Foundation

struct BudgetEvent: View {
    // Datos de ejemplo para el presupuesto mensual en Huatulco
    @State private var alimentacion = 8000.0
    @State private var transporte = 3000.0
    @State private var ocio = 4000.0
    @State private var hospedaje = 12000.0
    @State private var tours = 5000.0
    @State private var extras = 2000.0
    @State private var total = 33000.0  // Actualiza este total según los nuevos rubros agregados

    var body: some View {
        VStack {
            // Encabezado
            ZStack {
                Color(hex: "1a437d")
                    .ignoresSafeArea()
                Text("Presupuesto para Huatulco - 29 Días")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .regular))
            }
            .frame(height: 60)

            // Cuerpo
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    BudgetItem(title: "Alimentación", amount: $alimentacion, color: "64c9cc")
                    BudgetItem(title: "Transporte", amount: $transporte, color: "FFC43D")
                    BudgetItem(title: "Entretenimiento", amount: $ocio, color: "CF5C36")
                    BudgetItem(title: "Hospedaje", amount: $hospedaje, color: "9381FF")
                    BudgetItem(title: "Tours", amount: $tours, color: "E6CCBE")
                    BudgetItem(title: "Extras", amount: $extras, color: "C44536")
                    
                    Spacer()
                    
                    // Total
                    HStack {
                        Text("Total:")
                            .font(.system(size: 17, weight: .bold))
                        Spacer()
                        Text("MXN \(total, specifier: "%.2f")")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(Color(hex: "1a437d"))
                    }
                    .padding(.top, 20)
                    
                    // Botón para comenzar plan de ahorro
                    Button(action: {
                        // Acción que se ejecutará al presionar el botón
                    }) {
                        Text("Comenzar plan de ahorro")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(hex: "1a437d"))
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 35)
                .padding(.vertical, 20)
            }
        }
    }
}

struct BudgetItem: View {
    var title: String
    @Binding var amount: Double
    var color: String

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(Color(hex: color))
            Spacer()
            Text("MXN \(amount, specifier: "%.2f")")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(Color.black)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(2)
    }
}

struct PresupuestoEvento_Previews: PreviewProvider {
    static var previews: some View {
        BudgetEvent()
    }
}
