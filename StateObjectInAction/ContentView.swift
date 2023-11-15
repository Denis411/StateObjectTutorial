//
//  ContentView.swift
//  StateObjectInAction
//
//  Created by Dennis on 15/11/2566 BE.
//

import SwiftUI

struct MyStateObject {
    let text: String
}

class ViewModel: ObservableObject {
    @Published var myStateObject = MyStateObject(text: "")
    @Published var text = ""
    
    func update() {
        myStateObject = MyStateObject(text: String(Int.random(in: 0...10)))
        text = String(Int.random(in: 0...10))
    }
    
}

struct ContentView: View {
    @ObservableObject var vm = ViewModel()\
    
    var body: some View {
        Button {
            vm.update()
        } label: {
            Text("Update")
                .padding(20)
                .background(Color.green)
        }

    }
}

