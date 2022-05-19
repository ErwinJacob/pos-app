//
//  ContentView.swift
//  lelotest
//
//  Created by Jakub Górka on 03/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var baza: system = system()
    
//    @State var stoliki = Array<Stolik>()
    
    var body: some View {
        mainmenu(baza: system())
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
