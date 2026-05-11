//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by yashika.aggarwal.in on 08/05/26.
//

import SwiftUI

struct ContentView: View {
    
    //    Inside Struct Curlies , so have structwide scopes and can be used widely anywhere within this struct.. also with any views inside this struct  like Image , Text and Button here
    
    
    @State private var message = "Hey there!";
    @State private var toggle = true;
    
    //    In swift var can hold only one type of data, if we create variable to hold a string, later on we cannot put a number to it
    @State private var imgNum = 0;
    
    //    Since Now we are not using SystemName keyword (which works for Swift inbuilt images and icons), so now we cant set starting image as "swift" or any inbuilt image
    
    @State private var img = "";
    
    
    //    anything defined here is structwide and can be used anywhere within this struct
    
    var body: some View {
        VStack{
            Spacer()
            
            
            Image(img)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 20))
                .shadow(radius: 100)
            
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            
            Spacer()
            
            
            
            
            Button("Show Message!") {
                
                //                Using Ternary Operator
                message=toggle ? "You Are Awesome!" : "You Are Great!"
                img="image\(imgNum)"
                
                //                if (toggle==true){
                //                    message="You Are Awesome!"
                //                    img="sun.max.fill"
                //                }
                //                else{
                //                    message="You Are Great!"
                //                    img="hand.thumbsup.fill"
                //                }
                
                toggle = !toggle
                
                //TODO: -Update the image name variable-
                print("This is the \(imgNum)th click!")
                imgNum+=1;
                if (imgNum>9){
                    imgNum=0;
                }

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


