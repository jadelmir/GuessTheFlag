//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jad El mir on 5/12/20.
//  Copyright © 2020 Jad El mir. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["estonia","france","germany","ireland","italy","nigeria","poland","russia","spain","uk","us"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var ShowingScore = false
    @State private var scoreTitle = ""
    var body: some View {
        ZStack{
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack(spacing:30){
                  
                  VStack{
                            Text("Tap the flag of")
                                .foregroundColor(.white)
                            Text(countries[correctAnswer])
                                .foregroundColor(.white)
                        }
                        ForEach(0 ..< 3 ){number in
                          Button(action: {
                            self.flagTapped(number)
                          }){
                                    Image(self.countries[number]).renderingMode(.original)
                          }
                        }
                Spacer()
              }
            
        }
        .alert(isPresented: $ShowingScore){
            Alert(title: Text("hello"), message: Text("\(scoreTitle)"), dismissButton: .default(Text("Continue")){
                self.askQuestion()
                })
        }
    }
    
    func askQuestion(){
        countries.shuffled()
        correctAnswer = Int.random(in: 0 ..< 3 )
    }
    func flagTapped(_ number:Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
        }else {
            scoreTitle = "Wrong"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
