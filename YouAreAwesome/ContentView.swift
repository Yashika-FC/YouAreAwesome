//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by yashika.aggarwal.in on 08/05/26.
//

import SwiftUI;
//import adds frameworks (sometimes called modules) to expand capabilities avaible to programmers.  gives access to additional methods and data sructures so you can include addtional fucntionality in your programs
import AVFAudio;

struct ContentView: View {
    
    //    anything defined here is structwide and can be used anywhere within this struct
    
    //    Inside Struct Curlies , so have structwide scopes and can be used widely anywhere within this struct.. also with any views inside this struct  like Image , Text and Button here
    
    
    @State private var message = "Hey there!";
    @State private var toggle = true;
    
    //    In swift var can hold only one type of data, if we create variable to hold a string, later on we cannot put a number to it
//    @State private var imgNum = 0;
//    @State private var msgNum = 0;
    
    //    Since Now we are not using SystemName keyword (which works for Swift inbuilt images and icons), so now we cant set starting image as "swift" or any inbuilt image
    
    @State private var img = "";
    @State private var msgsArr : [String] = ["You Are Awesome!", "Fabulous? That\'s You!", "You Are Marvelous!", "You Make Me Smile!", "I Think You\'re Magic!", "You Are Skilled", "You Are so Kind!", "You Are Perfect!" ,"You are the Best Version of Yourself!","You Are The Best!)"]
    
//    Every stored property  @State must have a value before initialization completes.
    @State private var soundName = "";
    
    @State private var lastMsgIdx : Int = -1;
    @State private var lastImgIdx : Int = -1;
    @State private var lastSoundIdx : Int = -1;
    
    private let numOfImages = 10;
    private let numOfSounds = 6;
    
    @State private var audioPlayer : AVAudioPlayer!;

    
    
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
            
            Spacer()
            
            Image(img)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 20))
                .shadow(radius: 100)
//            keep extraBounce to 0.2 or below to avoid distortion
                .animation(.bouncy(duration: 0.4, extraBounce: 0.2), value: img)
            
            
            
            Spacer()
            
            Button("Show Message!") {
                
                var msgIdx : Int;
                var imgIdx : Int;
                var soundIdx : Int;

                
                repeat {
                    msgIdx = Int.random(in: 0...msgsArr.count-1)
                }while (msgIdx == lastMsgIdx)
                
                message=msgsArr[msgIdx]
                lastMsgIdx = msgIdx;
                
                repeat {
                    imgIdx = (Int.random(in: 0...(numOfImages-1)))
                }while (imgIdx == lastImgIdx)
                
                img = "image\(imgIdx)"
                lastImgIdx = imgIdx;
                
                
                repeat {
                    soundIdx = (Int.random(in: 0...(numOfSounds-1)))
                }while (soundIdx == lastSoundIdx)
                
                soundName = "sound\(soundIdx)"
                lastSoundIdx = soundIdx;
                
//                 guard is swift keyword means can be used by non apple products while NSDataAsset is of Apple, which Non-apple products cant use
                guard let soundFile = NSDataAsset(name: soundName) else{
                    print("😡 Could Not read file name \(soundName)")
                    return
                }
                
//                do-try-catch --> for error handling
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                }
                catch {
                    print("😡 ERROR: \(error.localizedDescription) creating audioPlayer")
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


