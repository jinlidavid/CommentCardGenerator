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
    @State private var happiness: Double = 7.0
    @State private var moreEW: Bool = false
    @State private var lessRepetition: Bool = false
    
    var emoji_feelings: String {
        if happiness > 7 {
            return "😁"
        } else if happiness > 4 {
            return "🙂"
        } else {
            return "😔"
        }
    }
    var feelings: String {
        if happiness > 7 {
            return "confident"
        } else if happiness > 4 {
            return "ok"
        } else {
            return "confused"
        }
    }
    
    
    var body: some View {
        
        let moreEWs = Binding<Bool> (get: {self.moreEW}, set: {newValue in
            self.moreEW = newValue
            }
        )
        let lessRepetitive = Binding<Bool> (get: {self.lessRepetition}, set: {newValue in
            self.lessRepetition = newValue
            }
        )
        
        Form {
            Section {
                HStack{
                    Slider(value: $happiness, in: 0...10, step: 1)

                    Text("\(emoji_feelings)")
                }
                Toggle("Too many EWs set", isOn: moreEWs)
                    .toggleStyle(.switch)
                
                Toggle("Too repetititive", isOn: lessRepetitive)
                    .toggleStyle(.switch)
            }
            Text("I am feeling \(feelings) in Computer Science. \(moreEW ? "I do feel that too many EWs are set." : "The amount of EW is perfect.") \(lessRepetition ? "I also feel that the divs are too repetitive." : "I enjoy the variety of the lessons.")")
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
