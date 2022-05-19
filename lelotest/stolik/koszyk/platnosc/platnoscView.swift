//
//  platnoscView.swift
//  lelotest
//
//  Created by Jakub Górka on 04/11/2021.
//

import SwiftUI

struct platnoscView: View {
    @ObservedObject var baza: system
    @ObservedObject var stolik: Stolik
    @State var rodzajPlatnosci: RodzajPlatnosci = RodzajPlatnosci.wybierz
    @State var kolorGotowka: Color = .cyan
    @State var kolorKarta: Color = .cyan
    @State var isActive: Bool = false

    var body: some View {

        VStack{
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 300.0, height: 130.0)
                    .foregroundColor(.cyan)
                VStack{
                    Text("Do zapłaty:")
                        .bold()
                        .font(.title2)
                        .foregroundColor(.black)
                    Text("\(String(stolik.sumaKoszyka))0 zł")
                        .bold()
                        .font(.title2)
                        .foregroundColor(.black)

                }
            }
                
            
            HStack{
                Spacer()
                
                Button(action: {
                    kolorKarta = .cyan
                    kolorGotowka = .blue
                    rodzajPlatnosci = RodzajPlatnosci.zaplaconoGotowka
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 130.0, height: 130.0)
                            .foregroundColor(kolorGotowka)
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 120.0, height: 120.0)
                            .foregroundColor(.cyan)
                        VStack{
                            Text("Płatność")
                                .bold()
                                .font(.title2)
                                .foregroundColor(.black)
                            Text("gotówką")
                                .bold()
                                .font(.title2)
                                .foregroundColor(.black)

                        }
                    }
                })
                
                Spacer()
                
                Button(action: {
                    kolorKarta = .blue
                    kolorGotowka = .cyan

                    rodzajPlatnosci = RodzajPlatnosci.zaplaconoKarta
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 130.0, height: 130.0)
                            .foregroundColor(kolorKarta)
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 120.0, height: 120.0)
                            .foregroundColor(.cyan)
                        VStack{
                            Text("Płatność")
                                .bold()
                                .font(.title2)
                                .foregroundColor(.black)
                            Text("kartą")
                                .bold()
                                .font(.title2)
                                .foregroundColor(.black)

                        }
                    }
                })
            
                Spacer()
            }
            NavigationLink(destination: mainmenu(baza: baza), isActive: $isActive) {
                Button(action: {
                    if rodzajPlatnosci == RodzajPlatnosci.zaplaconoGotowka{
                        baza.platnoscGotowka += stolik.sumaKoszyka
                    }
                    else{
                        baza.platnoscKarta += stolik.sumaKoszyka
                    }
                    isActive = true
                    
                    baza.zamknieteRachunki.append(stolik)
                    
//                    baza.stoliczki.remove(at: (stolik.numerStolika - 1))
                    
                    for (index, stolikkk) in baza.stoliczki.enumerated(){
                        if (stolik.numerStolika == stolikkk.numerStolika){
                            baza.stoliczki.remove(at: index)
                        }
                    }

                    
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 200.0, height: 80.0)
                            .foregroundColor(.green)
                        VStack{
                            Text("Potwierdź")
                                .bold()
                                .font(.title2)
                                .foregroundColor(.black)
                            Text("płatność")
                                .bold()
                                .font(.title2)
                                .foregroundColor(.black)

                        }
                    }
                    .padding(.top, 20.0)
                })
            }
            
            
        }
    }
}

struct platnoscView_Previews: PreviewProvider {
    static var previews: some View {
        platnoscView(baza: system(), stolik: Stolik(nazwaStolika: String(), nrStolika: Int()))
    }
}
