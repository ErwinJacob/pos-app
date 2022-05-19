
import SwiftUI

struct rachunki: View {
    
    @ObservedObject var baza: system

//    @State var nr: Int = 1
    
    var body: some View {
      
                
                VStack{

                    Button(action: {
                        
                        baza.stolikowDzis += 1
                        dodajStolik(stoliki: &baza.stoliczki, nazwaStolika: "Stolik \(baza.stolikowDzis)", nrStolika: baza.stolikowDzis)
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width: 120.0, height: 40.0)
                            Text("Dodaj stolik")
                                .foregroundColor(.white)
                        }
                    })
                        .padding(0.0)
                
                
                    
                    List(baza.stoliczki){ stolik in
                        PrzyciskStolik(stolik: stolik, baza: baza)
                        .padding(.vertical, 15.0)
                }
                .listStyle(.inset)
                .navigationTitle("Stoliki")
            }


    }
}

struct rachunki_Previews: PreviewProvider {
    static var previews: some View {
        rachunki(baza: system())
    }
}
