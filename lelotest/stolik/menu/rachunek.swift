
import Foundation

enum RodzajPlatnosci: String, CaseIterable, Identifiable {
    case wybierz
    case zaplaconoKarta
    case zaplaconoGotowka

    var id: String { self.rawValue }
}

class system: ObservableObject{
    @Published var stoliczki: [Stolik]
    @Published var zamknieteRachunki: [Stolik]
    @Published var platnoscKarta: Double
    @Published var platnoscGotowka: Double
    @Published var kp: Double
    @Published var kw: Double
    @Published var menu: [MenuSection]
    @Published var stolikowDzis: Int
    
    init(){
        self.stoliczki = []
        self.zamknieteRachunki = []
        self.platnoscKarta = 0
        self.platnoscGotowka = 0
        self.kp = 0
        self.kw = 0
        self.menu = []
        self.stolikowDzis = 0
    }
}

class MenuItem: ObservableObject, Identifiable{
    @Published var id: UUID
    @Published var name: String
    @Published var price: Double
    @Published var opis: String = ""
    
    init(itemName: String, itemPrice:Double){
        self.id = UUID()
        self.name = itemName
        self.price = itemPrice
        self.opis = ""
    }
    
//    init(copy: MenuItem){
//        self.id = copy.id
//        self.name = copy.name
//        self.price = copy.price
//        self.opis = copy.opis
//    }
}

class KoszykItem: ObservableObject, Identifiable{
    @Published var item: MenuItem
    @Published var opis: String
    
    init(item: MenuItem){
        self.item = item
        self.opis = ""
    }

    init(opis: String, item: MenuItem){
        self.item = item
        self.opis = opis
    }
}


class MenuSection: Identifiable, ObservableObject {
    @Published var id: UUID
    @Published var name: String
    @Published var items: [MenuItem]
    
    init(nazwaGrupy: String){
        self.name = nazwaGrupy
        self.id = UUID()
        self.items = []
    }
}

class Stolik: Identifiable, ObservableObject{
    @Published var id: UUID
    @Published var koszyk = Array<KoszykItem>()
    @Published var nazwa: String
    @Published var sumaKoszyka: Double
    @Published var numerStolika: Int
    
    init(nazwaStolika: String, nrStolika: Int){
        self.id = UUID()
        self.koszyk = []
        self.nazwa = nazwaStolika
        self.sumaKoszyka = 0
        self.numerStolika = nrStolika
    }
    
}

class StringInput: ObservableObject{
    @Published var tekst: String
    
    init(tekst: String){
        self.tekst = tekst
    }
}

class DoubleInput: ObservableObject{
    @Published var idk: Double

    init(idk: Double){
        self.idk = idk
    }
}

func dodajStolik(stoliki: inout Array<Stolik>, nazwaStolika: String, nrStolika: Int){
    
    
//    let nowyStolik: Stolik = Stolik(id: UUID(), koszyk: [], nazwa: nazwaStolika)
    let nowyStolik: Stolik = Stolik(nazwaStolika: nazwaStolika, nrStolika: nrStolika)
    stoliki.append(nowyStolik)
    
    
}

func start(menu: inout [MenuSection]){

    
    
    
    //Jedzenie

    let jedzenie: MenuSection = MenuSection(nazwaGrupy: "Jedzenie")
    
    
    let szarlotka: MenuItem = MenuItem(itemName: "Szarlotka", itemPrice: 12)
    jedzenie.items.append(szarlotka)
    
    let salatkaCezar = MenuItem(itemName: "Sałatka Cezar", itemPrice: 23)
    jedzenie.items.append(salatkaCezar)
    
    menu.append(jedzenie)

    //Napoje
    
    let napoje: MenuSection = MenuSection(nazwaGrupy: "Napoje")
    
    let caffeLatte = MenuItem(itemName: "Caffe Latte", itemPrice: 10)
    napoje.items.append(caffeLatte)
    
    let espresso = MenuItem(itemName: "Espresso", itemPrice: 5)
    napoje.items.append(espresso)
    
    
    menu.append(napoje)
    //Alkohole
    
    let alkohole: MenuSection = MenuSection(nazwaGrupy: "Alkohole")

    let harnas: MenuItem = MenuItem(itemName: "Harnas", itemPrice: 2)
    alkohole.items.append(harnas)
    
    let turbocola: MenuItem = MenuItem(itemName: "Trubo cola", itemPrice: 20)
    alkohole.items.append(turbocola)
    
    let zubrowka: MenuItem = MenuItem(itemName: "Żubrówka 40ml", itemPrice: 8)
    alkohole.items.append(zubrowka)
    
    
    menu.append(alkohole)
    
}

//func dodaj(koszyk: inout [MenuItem], nazwa: String, cena: Double, uuuid: UUID, sumaKoszyka: inout Double){
//    let dodany: MenuItem = MenuItem(id: uuuid, name: nazwa, price: cena)
//    koszyk.append(dodany)
//    sumaKoszyka += cena
//}


func dodaj(koszyk: inout [KoszykItem], dodany: MenuItem, sumaKoszyka: inout Double){
    let dod: KoszykItem = KoszykItem(item: dodany)
        
    koszyk.append(dod)
    sumaKoszyka += dodany.price
}

func opisz(koszyk: inout [MenuItem], nr: Int, opis: String){
    koszyk[nr].opis = opis
    
}

