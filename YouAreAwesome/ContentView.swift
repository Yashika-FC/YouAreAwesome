//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by yashika.aggarwal.in on 08/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "You Are Awesome!";
    
    var body: some View {
        VStack{
            Spacer()
                
                
            Image(systemName: "swift")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.orange)
                    .frame(width: 200, height: 200)
                    .padding()
            
            
            Text(message)
                    .font(.largeTitle)
                    .fontWeight(.ultraLight)
                    .foregroundStyle(.black)
            
            Spacer()
            
            HStack{
                Button("Awesome!") {
                    message="Awesome!"
                    print("You clicked me!")
                    print(message)
                }
                
                Button("Great!") {
                    message="Great!"
                    print("You clicked me!")
                    print(message)
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .fontWeight(.heavy)
            .foregroundStyle(.white)
            .tint(.orange)
        
        }
        .padding()
    }
}


#Preview {
    ContentView()
}


