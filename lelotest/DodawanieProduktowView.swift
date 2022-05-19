//
//  DodawanieProduktowView.swift
//  lelotest
//
//  Created by Jakub Górka on 10/12/2021.
//

import SwiftUI

struct Row: View{
    var body: some View{
        Text("example")
    }
}

struct DodawanieProduktowView: View {

    @ObservedObject var baza: system

    var body: some View {

        
        VStack{
            
            List{
                ForEach(baza.menu) {group in
                    Section(content: {
                        
                    }, header: {
                        Text(group.name)
                    })
                        
//                        ForEach(group) {item in
//                            HStack{
//                                Text(item.name)
//                                Spacer()
//                                Text("\(String(item.price))0 zł")
//                            }
                        
                    
                }
            }
            .listStyle(.grouped)
        }
    }
}

struct DodawanieProduktowView_Previews: PreviewProvider {
    static var previews: some View {
        DodawanieProduktowView(baza: system())
    }
}
