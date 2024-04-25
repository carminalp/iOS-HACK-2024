//
//  Oportunities.swift
//  RetoBBVA
//
//  Created by Alumno on 24/04/24.

import SwiftUI

struct Oportunities: View {
    
    @State private var navigateToNewEvent = false
    var body: some View {
        NavigationView{
            VStack{
                
                ZStack{
                    Color(hex: "4aa2a5")
                        .ignoresSafeArea(.all)
                    VStack(alignment: .leading, spacing: 20) {
                        Image(systemName: "square.split.2x2.fill")
                            .resizable()
                            .foregroundStyle(Color.white)
                            .frame(width: 75, height: 75)
                        
                        Text("Crea un evento para poder organizar tus gastos entre amigos")
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.white)
                            .font(.system(size: 22, weight: .medium))
                        
                        
                        NavigationLink(destination: NewEvent()){  Text("¡Me interesa!")
                                .foregroundColor(Color.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 13)
                                .font(.system(size: 17, weight: .bold))
                                .background(Color(hex: "2768b3"))
                        }
                        
                    }
                    .frame(width: 350)
                    
                }
                .frame(height: 300)
                Spacer()
                    .frame(height: 30)
                
                ScrollView {
                    VStack(alignment: .center, spacing: 30) {
                        
                        Image("oportunidades_card1")
                        .resizable()
                        .frame(width: 350, height: 125)
                        
                        Image("oportunidades_card2")
                        .resizable()
                        .frame(width: 350, height: 125)
                        
                        Image("oportunidades_card3")
                        .resizable()
                        .frame(width: 350, height: 125)
                    
                        
                        Spacer()
                    }
                }
            
            }
        }
    }
}

#Preview {
    Oportunities()
}
