//: [Previous](@previous)

/*:
 # [Practicing with the Adapter pattern](https://github.com/Make-School-Courses/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/blob/master/Lessons/05-Structural-PatternsPt.1/assignments/adapter.md)
 The following playground code currently is intended to utilize the Adapter pattern to link two incompatible components - an AudioPlayer and a VideoPlayer class - into an adapter class (MyPlayer class) which integrates the functionality of each component.
 
 However, none of the classes so far implement a pause() function, which is highly desired.
 
 The current code is also incomplete.
 
 ### TODO:
 
 1. Complete the current code so that it it runs and prints:
 ```
 Now Playing:  Titanium.aac
 Now Playing:  Cat_riding_a_roomba.mp4
 ```
 2. Using the Adapter pattern, add a pause() function.
 
 ### Playground Code
 */

import UIKit

enum MediaType {
    case mp4, wav, mov, aac
}

// Target protocol 1
protocol Play {
    associatedtype Media //using generics 40m
    func play(audioType: Media, fileName: String)
}

protocol Pause {
    func pause(fileName: String)
}

// Target protocol 2

//TODO: Implement a Pause protocol with a pause() function that accepts 1 parameter: A String called "fileName"


// Adaptee 1
class AudioPlayer {
    func playAudio(fileName: String) {
        print("Now Playing: ", fileName)
    }
    
    func pauseAudio(fileName: String) {
        print(fileName, " is now paused...")
    }
}

// Adaptee 2
class VideoPlayer {
    func playVideo(fileName: String) {
        print("Now Playing: ", fileName)
    }
    
    func pauseVideo(fileName: String) {
        print(fileName, " is now paused...")
    }
}

// Adapter (class)
class MyPlayer: Play {
    
    //TODO: create required player variables
    var videoPlayer = VideoPlayer()
    var audioPlayer = AudioPlayer()
    
    func play(audioType: MediaType, fileName: String) {
        if audioType == .mp4 {
            videoPlayer.playVideo(fileName: fileName)
        } else if audioType == .aac {
            audioPlayer.playAudio(fileName: fileName)
        }
    }
}

// Adapter (class extension)

extension MyPlayer: Pause {
    func pause(fileName: String) {
        audioPlayer.pauseAudio(fileName: fileName)
    }
}

//TODO: Implement a class extension which adds Pause functionality to MyPlayer


// Usage
let myPlayer = MyPlayer()
myPlayer.play(audioType: .aac, fileName: "Titanium.aac")
myPlayer.play(audioType: .mp4, fileName: "Cat_riding_a_roomba.mp4")
myPlayer.pause(fileName: "Cat_riding_a_roomba.mp4")


/* This should print:
 Now Playing:  Titanium.aac
 Now Playing:  Cat_riding_a_roomba.mp4
 Cat_riding_a_roomba.mp4  is now paused...
 */

//:Adapted from this Java code: http://hackjutsu.com/2015/11/07/Adapter%20Pattern/

//: [Next](@next)
