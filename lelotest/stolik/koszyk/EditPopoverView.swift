//
//  EditPopoverView.swift
//  lelotest
//
//  Created by Jakub Górka on 27/10/2021.
//

import SwiftUI

struct EditPopoverView: View {
    @State var opis: String = ""
    @State var nr: Int
    @ObservedObject var stolik: Stolik

    var body: some View {
        VStack{
            Divider()
            TextField("\t \t Placeholder \t \t", text: $opis)
                .fixedSize(horizontal: true, vertical: true)
                .textFieldStyle(.plain)
            
            Divider()
                .padding(.bottom, 50.0)
                
            Button(action: {
                stolik.koszyk[nr].opis = opis

            }) {
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 150.0, height: 45.0)
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
                    Text("Zapisz opis")
                        .foregroundColor(.white)
                        
                }
                .padding(.top, 10.0)
                
            }
        }
    }
}

struct EditPopoverView_Previews: PreviewProvider {
    static var previews: some View {
        EditPopoverView(nr: Int(), stolik: Stolik(nazwaStolika: String(), nrStolika: Int()))
    }
}
