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
    @State private var msgNum = 0;
    
    //    Since Now we are not using SystemName keyword (which works for Swift inbuilt images and icons), so now we cant set starting image as "swift" or any inbuilt image
    
    @State private var img = "";
    @State private var msgsArr : [String] = ["You Are Awesome!", "Fabulous? That\'s You!", "You Are Marvelous!", "You Make Me Smile!", "I Think You\'re Magic!", "You Are Skilled", "You Are so Kind!", "You Are Perfect!" ,"You are the Best Version of Yourself!","You Are The Best!)"]
    
    
    //    anything defined here is structwide and can be used anywhere within this struct
    
    var body: some View {
        VStack{
            
            
            //            Text Views are left justified By Default, Vstack makes one liners look centered alinged , but multilined text looks left-justified itelself
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            //            To make even multilined text center (as it is left aligned by default)
                .multilineTextAlignment(.center)
            
            //            minimum allowed height to be reduced to is 50% of the original, if the complete text not appears with original height in the frame height, setting it below 0.5 looks unprofessional
                .minimumScaleFactor(0.5)
                .frame(height: 100)
//            default duration of any animation whether image or text or anything is 0.35sec
//            .easeInOut is same as default animation with duration property, .linear is the normal animation
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Image(img)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 20))
                .shadow(radius: 100)
//            keep extraBounce to 0.2 or below to avoid distortion
                .animation(.bouncy(duration: 0.4, extraBounce: 0.2), value: img)
            
            
            
            Spacer()
            
            
            
            
            Button("Show Message!") {
                
                //                Using Ternary Operator
                //                message=toggle ? "You Are Awesome!" : "You Are Great!"
                //                img="image\(imgNum)"
                
                //                if (toggle==true){
                //                    message="You Are Awesome!"
                //                    img="sun.max.fill"
                //                }
                //                else{
                //                    message="You Are Great!"
                //                    img="hand.thumbsup.fill"
                //                }
                
                //                toggle = !toggle
                
                message=msgsArr[msgNum]
                img="image\(imgNum)"
                
                //TODO: -Update the image name variable-
                print("This is the \(imgNum)th image and \(msgNum)th msg!")
                print("You clicked -> \(message)")
                
                imgNum+=1;
                if (imgNum>9){
                    imgNum=0;
                }
                
                msgNum+=1;
                if msgNum>msgsArr.count-1{
                    msgNum=0;
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


