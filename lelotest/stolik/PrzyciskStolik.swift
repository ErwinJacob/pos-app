//
//  PrzyciskStolik.swift
//  lelotest
//
//  Created by Jakub Górka on 17/10/2021.
//

import SwiftUI

struct PrzyciskStolik: View {
    @ObservedObject var stolik: Stolik
    @ObservedObject var baza: system
    
    var body: some View {
            
                
        NavigationLink(destination: zamowienie(stolik: stolik, baza: baza), label: {
                    VStack{
                        Text(stolik.nazwa)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                })
            }
    
}

struct PrzyciskStolik_Previews: PreviewProvider {
    static var previews: some View {
        PrzyciskStolik(stolik: Stolik(nazwaStolika: String(), nrStolika: Int()), baza: system())
    
    }
}
