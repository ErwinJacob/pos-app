//
//  zamknietyRachunekView.swift
//  lelotest
//
//  Created by Jakub Górka on 05/11/2021.
//

import SwiftUI

struct zamknietyRachunekView: View {
    @State var stolik: Stolik
    var body: some View {
        VStack{
            Text("\n Koszyk: \(stolik.koszyk.count)")
            Text("\(String(stolik.sumaKoszyka))0 zł")
            
            List{
                ForEach(Array(stolik.koszyk.enumerated()), id: \.offset) { nr, item in
                    ItemKoszykView(item: item, stolik: stolik, nr: nr)
                }
            }
        }
    }
}

struct zamknietyRachunekView_Previews: PreviewProvider {
    static var previews: some View {
        zamknietyRachunekView(stolik: Stolik(nazwaStolika: String(), nrStolika: Int()))
    }
}
