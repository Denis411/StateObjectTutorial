//
//  ContentView.swift
//  StateObjectInAction
//
//  Created by Dennis on 15/11/2566 BE.
//

import SwiftUI

class MyStateObject: ObservableObject {
    var text: String = ""
    
    init(text: String) {
        self.text = text
    }
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
    // this vm might be recreated because it is not a StateObject, but not in this app
    @ObservedObject var vm = ViewModel()
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                // MyStateObjectView gets recreate here because vm.myStateObject gets update(has a new pointer)
                // We ,however, can use a method right in MyStateObject to update its property
                MyStateObjectView(stateObject: vm.myStateObject)
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

struct MyStateObjectView: View {
    @StateObject var stateObject: MyStateObject
    
    var body: some View {
        Text(stateObject.text)
    }
    
    init(stateObject: MyStateObject) {
        _stateObject = StateObject(wrappedValue: stateObject)
        print("Created new MyStateObjectView")
    }
}
