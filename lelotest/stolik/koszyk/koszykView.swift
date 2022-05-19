
import SwiftUI

struct koszykView: View {
    @ObservedObject var stolik: Stolik
    @State var isPopoverShown: Bool = false
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

struct koszykView_Previews: PreviewProvider {
    static var previews: some View {
        koszykView(stolik: Stolik(nazwaStolika: String(), nrStolika: Int()))
    }
}
