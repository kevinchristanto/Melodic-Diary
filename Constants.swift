//
//  Constants.swift
//  MelodicDiary
//
//  Created by Kevin Christanto on 06/04/23.
//

import Foundation
import AVFAudio

//let sound =

// Hopeless - Jimena Contreras
let kSadSongs: [Songs] = [
    getSongFile(songTitle: "Golden Cage", songArtist: "Untitled", songFileName: "Golden Cage - Jimena Contreras"),
    getSongFile(songTitle: "Hopeless", songArtist: "Untitled", songFileName: "Hopeless - Jimena Contreras"),
]
let kHappySongs: [Songs] = []
let kRelaxedSongs: [Songs] = []

func getSongFile(songTitle: String, songArtist: String, songFileName: String) -> Songs{
    
    return Songs(title: songTitle, artist: songArtist, music: try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: songFileName, ofType: "mp3")!)))
}


