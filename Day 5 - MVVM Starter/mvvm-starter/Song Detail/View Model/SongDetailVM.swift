//
//  SongDetailVM.swift
//  mvvm-starter
//
//  Created by Adriana González Martínez on 2/3/21.
//

import Foundation

class SongDetailVM {
      
    //TODO 4: Make these properties private to ensure only the VM can manupulate them
    private(set) var songName, songImageName, artist, releaseDate: String!
    private(set) var isFavorite: Bool!
    
    private var dataModel: Song! = nil
    
    var markFavoriteButtonPressed: () -> () = { }
    
    func viewDidLoad() {
        //TODO 2: call the configureDataModel with generated data for a song
        configureDataModel(data: songData())
        //TODO 3: call the configureOutput method
        configureOutput()
        
        markFavoriteButtonPressed = { [weak self] in
            guard let _self = self else { return }
            _self.isFavorite = !_self.isFavorite
        }
    }
        
    
    private func songData() -> [String: Any] {
        //TODO 2.1: Return a random song using the Data Source
        return DataSource.randomSong()
    }
    
    private func configureDataModel(data: [String: Any]) {
        dataModel = Song(data: data)
    }
    
    private func configureOutput() {
        //TODO 3.1: Configure the output that can be accessed by the view
        songName = dataModel.songName
        songImageName = dataModel.songImageName
        artist = dataModel.artist
        releaseDate = releaseDisplayData()
        isFavorite = dataModel.isFavorite
    }
    
    private func releaseDisplayData() -> String {
        //TODO 3.2: Use the format "MMMM dd,yyyy" for the release date
        let songDateString = dataModel.releaseDate
        let formatter4 = DateFormatter()
        formatter4.dateFormat = "MMMM dd, yyyy"
        return formatter4.string(from: songDateString)
    }
}
