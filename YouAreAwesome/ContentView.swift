//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by yashika.aggarwal.in on 08/05/26.
//

import SwiftUI

struct ContentView: View {
    
    //    Inside Struct Curlies , so have structwide scopes and can be used widely anywhere within this struct.. also with any views inside this struct  like Image , Text and Button here
    
    @State private var message = "You Are Awesome!";
    @State private var toggle = true;
    @State private var img:String="swift"
    
    //    anything defined here is structwide and can be used anywhere within this struct
    
    var body: some View {
        VStack{
            Spacer()
            
            
            Image(systemName: img)
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
            
            
            
            
            Button("Press Me!") {
                
                //                Using Ternary Operator
                message=toggle ? "You Are Awesome!" : "You Are Great!"
                img=toggle ? "sun.max.fill" : "hand.thumbsup.fill"
                
                //                if (toggle==true){
                //                    message="You Are Awesome!"
                //                    img="sun.max.fill"
                //                }
                //                else{
                //                    message="You Are Great!"
                //                    img="hand.thumbsup.fill"
                //                }
                
                toggle = !toggle
                print("You clicked -> \(message)")
                
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


