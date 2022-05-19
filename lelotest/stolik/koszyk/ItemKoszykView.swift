import SwiftUI

struct ItemKoszykView: View {
    
    @ObservedObject var item: KoszykItem
    @State var isPopoverShown: Bool = false
    @ObservedObject var stolik: Stolik
    @State var nr: Int
    @State var opis: StringInput = StringInput(tekst: "xd")

    
    var body: some View {
        HStack{
            Text("\(nr+1) \t \(item.item.name)")
            Spacer()
            Text(item.opis)
            Spacer()
            Text("\(String(item.item.price))0 zł")
            
        }
        .popover(isPresented: $isPopoverShown) {
            EditPopoverView(nr: nr, stolik: stolik)
        }
        
        
        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
            if item.item.name != "Rabat"{ //wyłaczenie dla rabatów
                Button(role: .destructive) {
                    stolik.koszyk.remove(at: nr)
                    stolik.sumaKoszyka = stolik.sumaKoszyka - item.item.price
                    sprawdzRabaty(stolik: stolik)
                } label: {
                    Label("Delete", systemImage: "trash")
                }
                    Button {
                        isPopoverShown = true
                } label: {
                    Label("Flag", systemImage: "pencil")
                }
            }
        }
    }
}

struct ItemKoszykView_Previews: PreviewProvider {
    static var previews: some View {
        ItemKoszykView(item: KoszykItem(item: MenuItem(itemName: String(), itemPrice: Double())), stolik: Stolik(nazwaStolika: String(), nrStolika: Int()), nr: Int())
    }
}
