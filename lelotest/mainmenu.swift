//
//  mainmenu.swift
//  lelotest
//
//  Created by Jakub Górka on 03/11/2021.
//

import SwiftUI

struct mainmenu: View {
    
    @ObservedObject var baza: system
    @State var menu = Array<MenuSection>()
    @State var zmianaKolor: Color = .red
    @State var zmianaText: String = "Rozpocznij"

    var body: some View {
        NavigationView{
        VStack{
            Spacer()
            
            ZStack{
                Capsule()
                    .frame(width: 300.0, height: 70.0)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    
                Text("Gastro szef lelo ;)")
                    .font(.title2)
                    .bold()
            }            
            
            Spacer()
            
            HStack{
                Spacer()
                
                NavigationLink(destination: rachunki(baza: baza)) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 130.0, height: 130.0)
                            .foregroundColor(.cyan)
                        Text("Rachunki")
                            .bold()
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)

                Spacer()
                NavigationLink(destination: raportView(baza: baza)) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 130.0, height: 130.0)
                            .foregroundColor(.cyan)
                        Text("Raport")
                            .bold()
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)

                Spacer()
            }
            
            Spacer()
            
            
            HStack{

                Spacer()
                NavigationLink(destination: zamknieteRachunkiView(baza: baza)) {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 130.0, height: 130.0)
                        .foregroundColor(.cyan)
                    VStack{
                        Text("Zamkniete")
                            .bold()
                            .font(.title2)
                            .foregroundColor(.black)

                        Text("rachunki")
                            .bold()
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                }
                }
                Spacer()
                Button(action: {
                    
                    if zmianaText == "Rozpocznij"{
                        zmianaText = "Zakończ"
                        zmianaKolor = .green
                        
                        return
                    }
                    
                    if zmianaText == "Zakończ"{
                        zmianaText = "Rozpocznij"
                        zmianaKolor = .red
                    }

                }, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 130.0, height: 130.0)
                        .foregroundColor(zmianaKolor)
                    VStack{
                        Text(zmianaText)
                            .bold()
                            .font(.title2)
                            .foregroundColor(.black)
                        Text("dzień")
                            .bold()
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                }
                })

                Spacer()
            }
            
            Spacer()
            
            NavigationLink(destination: UstawieniaView(baza: baza)) {
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 250.0, height: 75.0)
                    .foregroundColor(.cyan)
                VStack{
                    Text("Ustawienia")
                        .bold()
                        .font(.title2)
                        .foregroundColor(.black)
                    Text("systemu")
                        .bold()
                        .font(.title2)
                        .foregroundColor(.black)
                        }
                    }
                }

            
            Spacer()
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
    
}


struct mainmenu_Previews: PreviewProvider {
    static var previews: some View {
        mainmenu(baza: system())
    }
}
