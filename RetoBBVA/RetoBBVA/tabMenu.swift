//
//  tabMenu.swift
//  RetoBBVA
//
//  Created by Alumno on 24/04/24.
//

import SwiftUI

struct tabMenu: View {
    var body: some View {
        TabView {
                    Home()
                        .tabItem {
                            Label("Inicio", systemImage: "homekit")
                        }

                    
                    Home()
                        .tabItem {
                            Label("Salud Financiera", systemImage: "arrow.up.heart.fill")
                        }
                
                    Oportunities()
                        .tabItem {
                            Label("Oportunidades", systemImage: "plus.circle.fill")
                        }
            
                    Home()
                        .tabItem {
                            Label("Notificaciones", systemImage: "envelope.fill")
                        }
                    
                    Home()
                        .tabItem {
                            Label("Ayuda", systemImage: "person.bubble.fill")
                        }
                }
                    .navigationBarHidden(true)
                
        }
}

#Preview {
    tabMenu()
}
