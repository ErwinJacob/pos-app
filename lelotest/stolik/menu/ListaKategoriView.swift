//
//  ListaKategoriView.swift
//  lelotest
//
//  Created by Jakub Górka on 23/10/2021.
//

import SwiftUI

struct ListaKategoriView: View {
//    @State var menu = Array<MenuSection>()
    @ObservedObject var baza: system

    @ObservedObject var stolik: Stolik


    var body: some View {
        NavigationView{
            List{
                ForEach(baza.menu) {group in
                    NavigationLink(destination: ListaPozycjiView(group: group.items, stolik: stolik), label: {
                            Text(group.name)
                        })
                }
            }
            .navigationTitle("Kategorie")

        }
        .navigationTitle(stolik.nazwa)
        .onAppear{
//            if baza.menu.isEmpty{
//            start(menu: &baza.menu)
//            }
        }
    }
}

struct ListaKategoriView_Previews: PreviewProvider {
    static var previews: some View {
//        ListaKategoriView(menu: Array<MenuSection>(), stolik: Stolik(nazwaStolika: String()))
        ListaKategoriView(baza: system(), stolik: Stolik(nazwaStolika: String(), nrStolika: Int()))
    }
}
