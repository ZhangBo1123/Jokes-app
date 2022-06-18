//
//  ContentView.swift
//  Jokes app
//
//  Created by Zhang Bo on 15/6/22.
//

import SwiftUI

struct ContentView: View {
    
    var jokes = [
        Joke(setup: "Why did the chicken cross the road?", punchline: "To get to the other side!"),
        Joke(setup: "Why did the scarecrow win an award?", punchline: "Because it was out standing in its field!"),
        Joke(setup: "Why was the bicycle unable to go to work?", punchline: "Because it was two-tyred!"),
    ]
    
    @State var isPunchlineShown = false
    @State var jokeIndex = 0
    @State var isAlertShown = false
    @State var isSheetShown = true
    var body: some View {
        ZStack {
            Color.teal
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    if isPunchlineShown {
                        jokeIndex += 1
                        isPunchlineShown = false
                        if jokeIndex == jokes.count {
                            jokeIndex = 0
                        }
                        isAlertShown = true
                    }
                }
            VStack {
                Text(jokes[jokeIndex].setup)
                    .padding()
                Button {
                    isPunchlineShown = true
                } label: {
                    Text("*Tell* me!")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                }
                
                if isPunchlineShown {
                    Text(jokes[jokeIndex].punchline)
                        .padding()
                    Text("Tap to continue")
                        .font(.caption)
                        .padding()
                }
                
            }
        }
        .sheet(isPresented: $isSheetShown, content: {
            ResponseView()
        })
        .alert("Did you like that joke?", isPresented: $isAlertShown) {
            
            Button(role: .none) {
                print("Yay!")
            } label: {
                Text("Yes")
            }
            
            Button(role: .cancel) {
                print("Nooooooooo")
            } label: {
                Text("No")
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
