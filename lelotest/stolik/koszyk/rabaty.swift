import Foundation

func sprawdzRabaty(stolik: Stolik){
    sprawdzRabatSzarlotka(stolik: stolik)
}

func sprawdzRabatSzarlotka(stolik: Stolik){
    
    //harnas(-50%) + szarlotka
    
    var szarlotkaExist: Bool = false
    var szarlotkaCount: Int = 0
    var harnasExist: Bool = false
    var harnasCount: Int = 0
    var juzNabiteRabaty: Int = 0
    var spodziewaneRabaty: Int = 0
    
    for itemm in stolik.koszyk{
        if itemm.item.name == "Szarlotka"{
            szarlotkaExist = true
            szarlotkaCount+=1
        }
        
        if itemm.item.name == "Harnas"{
            harnasExist = true
            harnasCount+=1
            
        }
        
        if itemm.item.name == "Rabat"{
            juzNabiteRabaty+=1

        }
    }

    if harnasCount <= szarlotkaCount{
        spodziewaneRabaty = harnasCount
    }
    
    if szarlotkaCount <= harnasCount{
        spodziewaneRabaty = szarlotkaCount
    }
    
    if spodziewaneRabaty < juzNabiteRabaty{
        
        for (index, item) in stolik.koszyk.enumerated(){
            if (item.item.name == "Rabat" && item.item.price == -1){
                stolik.koszyk.remove(at: index)
                stolik.sumaKoszyka += 1
            }
        }
        
    }
    
    if juzNabiteRabaty == spodziewaneRabaty{
        return
    }
    
    if(harnasExist == true && szarlotkaExist == true){
        if harnasCount < szarlotkaCount{
            for _ in 1...(harnasCount - juzNabiteRabaty){
                stolik.koszyk.append(KoszykItem(item: MenuItem(itemName: "Rabat", itemPrice: -1)))
                stolik.sumaKoszyka -= 1
            }
            
            return
        }
        
        if harnasCount > szarlotkaCount{
            for _ in 1...(szarlotkaCount - juzNabiteRabaty){
                stolik.koszyk.append(KoszykItem(item: MenuItem(itemName: "Rabat", itemPrice: -1)))
                stolik.sumaKoszyka -= 1

            }
            
            return
        }
        
        if harnasCount == szarlotkaCount{
            for _ in 1...(szarlotkaCount - juzNabiteRabaty){
                stolik.koszyk.append(KoszykItem(item: MenuItem(itemName: "Rabat", itemPrice: -1)))
                stolik.sumaKoszyka -= 1
            }
            
            return
        }

        
    }
    
    
}
