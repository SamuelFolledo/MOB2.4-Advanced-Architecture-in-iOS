//
//  DataSource.swift
//  mvvm-starter
//
//  Created by Adriana González Martínez on 2/3/21.
//

import Foundation

class DataSource {
    
    static func randomSong() -> [String: Any] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let releaseDate = dateFormatter.date(from: "2001-04-01") as Any
        return ["songName": "La Valse d'Amélie" ,"songImageName": "piano" ,"isFavorite": false ,"artist": "Yann Tiersen" ,"releaseDate": releaseDate]
    }
    
}
