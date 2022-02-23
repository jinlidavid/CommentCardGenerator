//
//  ContentView.swift
//  CommentCardGenerator
//
//  Created by Jin Li, David (MAG) on 08/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var happiness: Double = 7.0
    @State private var moreEW: Bool = false
    @State private var lessRepetition: Bool = false
    @State private var isFast: Bool = false
    @State private var isCompSci: Bool = false
    @State private var isMaths: Bool = false
    @State private var isMathsDisabled: Bool = false
    @State private var isCompSciDisabled: Bool = false
    @State var subjectChosen: Bool = false
    @State var textFieldText: String = ""
    @State var dataArray: [String] = []
    @State var comment: String = ""
    @State var subject: String = ""

    
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
        let tooFast = Binding<Bool> (get: {self.isFast}, set: {newValue in
            self.isFast = newValue
            }
        )
        let compSciSelected = Binding<Bool> (get: {self.isCompSci}, set: {newValue in
            self.isCompSci = newValue
            self.subject = "Computer Science"
            self.subjectChosen = newValue
            if newValue == true {
                self.isMathsDisabled = true
            } else {
                self.isMathsDisabled = false
            }
            }
        )
        let mathsSelected = Binding<Bool> (get: {self.isMaths}, set: {newValue in
            self.isMaths = newValue
            self.subject = "Maths"
            self.subjectChosen = newValue
            if newValue == true {
                self.isCompSciDisabled = true
            } else {
                self.isCompSciDisabled = false
            }
            }
        )
        
        NavigationView {
            VStack {
                Section {
                    VStack {
                        Text("Select your subject:")
                        HStack{
                            Toggle("CComW-1", isOn: compSciSelected)
                                .toggleStyle(.button)
                                .disabled(isCompSciDisabled)
                                
                            Toggle("CMdpV-1", isOn: mathsSelected)
                                .toggleStyle(.button)
                                .disabled(isMathsDisabled)
                        }
                        
                        Text("Rate your confidence in the subject:")
                        
                        HStack{
                            Slider(value: $happiness, in: 0...10, step: 1)
                            Text("\(emoji_feelings)")
                        }
                        Text("Select all that apply to the subject:")
                        HStack{
                            Toggle("Too many EWs", isOn: moreEWs)
                                .toggleStyle(.button)
                                    
                            Toggle("Too repetititive", isOn: lessRepetitive)
                                .toggleStyle(.button)
                        }
                        Toggle("Pacing too fast", isOn: tooFast)
                            .toggleStyle(.button)
                    }
                    .padding()
                    VStack{
                        TextField("Additional comments", text:$textFieldText)
                    }
                    .padding()
                    Spacer()
                }
                
                Section{
                    Text("I am feeling \(feelings) in \(subject). \(moreEW ? "I do feel that too many EWs are set." : "The amount of EW is perfect.") \(lessRepetition ? "I also feel that the divs are too repetitive." : "I enjoy the variety of the lessons.")\(isFast ? "I sometimes find that the lessons are hard to follow." : " I think the pacing of each lesson is good.") \(textFieldText)")
                }
                .padding()
                Spacer()
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        saveText()
                    }, label: {
                        Text("SAVE AND COPY")
                            .font(.headline)
                    })
                    Spacer()
                }
            }
            .navigationTitle("Comment Cards")
        }
    }
    
    func saveText(){
        dataArray.append(textFieldText)
        textFieldText = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
