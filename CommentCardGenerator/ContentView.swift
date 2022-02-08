//
//  ContentView.swift
//  CommentCardGenerator
//
//  Created by Jin Li, David (MAG) on 08/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State var isHappy: Bool
    @State var isEnjoyable: Bool
    var body: some View {
        Form {
            VStack {
                if isHappy {
                    Button("I am: 😁", action: {toggleHappiness()})
                        
                } else {
                    Button("I am: ☹️", action: {toggleHappiness()})
                }
            }
            Text("I am feeling \(isHappy ? "confident" : "worried") in Computer Science")
                .padding()
        }
        
    }
    
    func toggleHappiness() {
        isHappy.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(isHappy: true, isEnjoyable: true)
    }
}
