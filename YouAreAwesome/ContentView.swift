//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by yashika.aggarwal.in on 08/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image(systemName: "iphone.gen1.circle.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.cyan)
            
            Image(systemName: "cloud.sun.rain.circle.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.red)
            
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
        }
                
            Text("You Are Awesome!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(.purple))
            
        
        .padding()
    }
}


#Preview {
    ContentView()
}


