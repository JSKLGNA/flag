//
//  ContentView.swift
//  flag
//
//  Created by JSKLJN on 04.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var contries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.pink,.black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing:30){
                VStack {
                    Text("Tap the flag of")
                        .font(.title)
                        .foregroundStyle(.white)
                    
                    Text(contries[correctAnswer])
                        .foregroundStyle(.white)
                        //.font(.title)
                        .font(.largeTitle.weight(.semibold))
                }
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    }label: {
                        Image(contries[number])
                            .clipShape(.buttonBorder)
                    }
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button( "Continue", action: askQuestion)
        }message: {
            Text("Your score is???")
        }
    }
    func flagTapped(_ number: Int){
        if number == correctAnswer{
            scoreTitle = "Correct"
        }else{
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion(){
        contries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}

