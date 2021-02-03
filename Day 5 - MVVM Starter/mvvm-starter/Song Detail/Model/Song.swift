//
//  Song.swift
//  mvvm-starter
//
//  Created by Adriana González Martínez on 2/3/21.
//

import Foundation

struct Song {
    var songName = ""
    var songImageName = ""
    var isFavorite = false
    var artist = ""
    var releaseDate = Date()

    init(data: [String: Any]) {
        songName = data["songName"] as! String
        songImageName = data["songImageName"] as! String
        isFavorite = data["isFavorite"] as! Bool
        artist = data["artist"] as! String
        releaseDate = data["releaseDate"] as! Date
    }
}
