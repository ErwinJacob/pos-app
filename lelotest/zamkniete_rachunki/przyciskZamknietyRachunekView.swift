//
//  przyciskZamknietyRachunekView.swift
//  lelotest
//
//  Created by Jakub Górka on 05/11/2021.
//

import SwiftUI

struct przyciskZamknietyRachunekView: View {
    @ObservedObject var stolik: Stolik
    @ObservedObject var baza: system
    
    var body: some View {
            
                
        NavigationLink(destination: zamknietyRachunekView(stolik: stolik), label: {
                    VStack{
                        Text(stolik.nazwa)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                })
            }
    
}

struct przyciskZamknietyRachunekView_Previews: PreviewProvider {
    static var previews: some View {
        przyciskZamknietyRachunekView(stolik: Stolik(nazwaStolika: String(), nrStolika: Int()), baza: system())
    }
}
