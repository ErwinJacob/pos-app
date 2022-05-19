//
//  ListaPozycjiView.swift
//  lelotest
//
//  Created by Jakub Górka on 23/10/2021.
//

import SwiftUI

struct ListaPozycjiView: View {
    
    @State var group = Array<MenuItem>()
    @ObservedObject var stolik: Stolik


    var body: some View {
        
            List{
                ForEach(group) {item in
                    Button(action: {
                        dodaj(koszyk: &stolik.koszyk, dodany: item, sumaKoszyka: &stolik.sumaKoszyka)
                        sprawdzRabaty(stolik: stolik)
                    }, label: {
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("\(String(item.price))0 zł")
                                
                        }
                    })
                }
            }
        
        
    }
}

struct ListaPozycjiView_Previews: PreviewProvider {
    static var previews: some View {
        ListaPozycjiView(stolik: Stolik(nazwaStolika: String(), nrStolika: Int()))
    }
}
