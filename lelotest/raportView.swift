//
//  raportView.swift
//  lelotest
//
//  Created by Jakub Górka on 03/11/2021.
//

import SwiftUI

struct raportView: View {

    @ObservedObject var baza: system

    var body: some View {

        VStack{
            Text("Utarg: \(String(baza.platnoscKarta + baza.platnoscGotowka))0 zł")
                .bold()
            
            Text("Zaplacone kartą: \(String(baza.platnoscKarta))0 zł")
                .bold()
            
            Text("Zaplacono gotowka: \(String(baza.platnoscGotowka))0 zł")
                .bold()

//            Text("Kasa wypłaciła: \(String(baza.kw))0 zł")
//                .bold()
//
//            Text("Kasa przyjeła: \(String(baza.kp))0 zł")
//                .bold()
                        
        }
    }
}

struct raportView_Previews: PreviewProvider {
    static var previews: some View {
        raportView(baza: system())
    }
}

