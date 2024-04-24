//
//  Home.swift
//  RetoBBVA
//
//  Created by Alumno on 24/04/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            
            VStack(spacing: 20){
                CircleImage(icon: "person.fill", color: Color.gray)
                // Encabezado
                Text("Buenos días, Cristina")
                    .font(.title)
                    .padding()
            }

            
            // Botones principales
            HStack(spacing: 20) {
                CircleButton(icon: "arrow.left.arrow.right", color: Color(hex: "3d81bc"))
                CircleButton(icon: "plus", color: Color(hex:"f09048"))
                CircleButton(icon: "dollarsign.square", color: Color(hex: "4aa2a5"))
            }
            .padding()
            
            // Cuentas y tarjetas
            VStack(alignment: .leading, spacing: 20) {
                AccountRow(accountName: "Cuenta", balance: "$2,500.20")
                AccountRow(accountName: "Ahorro", balance: "$20,000.00")
                AccountRow(accountName: "Cuenta express", balance: "$40,000.00")
                CreditCardRow(cardName: "Oro internacional", creditLimit: "$100,000.00", balanceUsed: "$200,000.00")
            }
            .padding()
            
            Spacer()
        }
    }
}

struct CircleButton: View {
    var icon: String
    var color: Color
    
    var body: some View {
        Button(action: {
            // Acción al presionar el botón
        }) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(Color.white)
                .padding(20)
                .background(color)
                .clipShape(Circle())
        }
    }
}

struct CircleImage: View {
    var icon: String
    var color: Color
    
    var body: some View {
        Image(systemName: icon)
            .font(.title)
            .foregroundColor(Color.white)
            .padding(20)
            .background(color)
            .clipShape(Circle())
    }
}


struct AccountRow: View {
    var accountName: String
    var balance: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(accountName)
                    .font(.headline)
                Text(balance)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
}

struct CreditCardRow: View {
    var cardName: String
    var creditLimit: String
    var balanceUsed: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(cardName)
                    .font(.headline)
                Text("Crédito disponible: \(creditLimit)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Saldo utilizado: \(balanceUsed)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}



#Preview {
    Home()
}
