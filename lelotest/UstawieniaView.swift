//
//  UstawieniaView.swift
//  lelotest
//
//  Created by Jakub Górka on 10/12/2021.
//

import SwiftUI

struct UstawieniaView: View {
    
    @ObservedObject var baza: system

    
    var body: some View {

        VStack{
            Text("Ustawienia")
                .bold()
                .font(.largeTitle)
                .padding(.bottom, 20.0)
            
            
            NavigationLink(destination: DodawanieProduktowView(baza: baza)){
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 300.0, height: 75.0)
                        .foregroundColor(.cyan)
                    Text("Baza produktow")
                        .bold()
                        .font(.title2)
                        .foregroundColor(.black)
                }
            }
            
            Spacer()

        }

    }
}

struct UstawieniaView_Previews: PreviewProvider {
    static var previews: some View {
        UstawieniaView(baza: system())
    }
}
