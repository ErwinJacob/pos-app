
import SwiftUI
import UIKit

struct zamowienie: View {
        
    
        @ObservedObject var stolik: Stolik
        @State var tekst = "aaaa"
        @State var opis: String = "xd"
    @ObservedObject var baza: system
//    @State var menu :[MenuSection] = baza.menu

        
        var body: some View {

            VStack{
                Text("Menu")
                    .bold()
                    .onAppear{
                        if baza.menu.isEmpty{
                        start(menu: &baza.menu)
                        }
                        
                    }
                
//                ListaKategoriView(menu: baza.menu, stolik: stolik)
                    ListaKategoriView(baza: baza, stolik: stolik)
                NavigationLink(destination: platnoscView(baza: baza, stolik: stolik), label: {
                    ZStack{
                        Capsule()
                            .frame(width: 200.0, height: 40.0)
                            .foregroundColor(.blue)
                        Text("Zapłać")
                            .bold()
                            .foregroundColor(.white)
                    }
                })

                koszykView(stolik: stolik)
                
                
        }
            
    }
}

struct zamowienie_Previews: PreviewProvider {
    static var previews: some View {
        zamowienie(stolik: Stolik(nazwaStolika: "", nrStolika: Int()), baza: system())
    }
}
