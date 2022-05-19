//
//  zamknieteRachunkiView.swift
//  lelotest
//
//  Created by Jakub Górka on 05/11/2021.
//

import SwiftUI

struct zamknieteRachunkiView: View {
    
    @ObservedObject var baza: system

    
    var body: some View {

        List(baza.zamknieteRachunki){ stolik in
            przyciskZamknietyRachunekView(stolik: stolik, baza: baza)
        }
    }
}

struct zamknieteRachunkiView_Previews: PreviewProvider {
    static var previews: some View {
        zamknieteRachunkiView(baza: system())
    }
}
