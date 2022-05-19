//
//  NazwijStolik.swift
//  lelotest
//
//  Created by Jakub Górka on 19/10/2021.
//

import SwiftUI

struct NazwijStolik: View {

    @State var nazwa: StringInput
    var body: some View {

        VStack{
            
            TextField("Nazwa Stolika", text: $nazwa.tekst)
            
        }

    }
}

struct NazwijStolik_Previews: PreviewProvider {
    static var previews: some View {
        NazwijStolik(nazwa: StringInput(tekst: String()))
    }
}
