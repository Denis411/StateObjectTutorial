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
    @Published var myStateObject = MyStateObject(text: "Initial state object")
    @Published var text = "Initial text"
    
    func update() {
        myStateObject = MyStateObject(text: String(Int.random(in: 0...10)))
        text = String(Int.random(in: 0...10))
    }
    
}

struct ContentView: View {
    @ObservedObject var vm = ViewModel()
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Text(vm.myStateObject.text)
                Text(vm.text)
            }
            .fontWeight(.bold)
            .font(.system(size: 35))
            Button {
                vm.update()
            } label: {
                Text("Update")
            }
        }
    }
}

