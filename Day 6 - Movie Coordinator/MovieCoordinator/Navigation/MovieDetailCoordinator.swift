//
//  MovieDetailCoordinator.swift
//  MovieCoordinator
//
//  Created by Samuel Folledo on 2/8/21.
//  Copyright © 2021 Alfian Losari. All rights reserved.
//

import UIKit

class MovieDetailCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var movieDetailViewController: MovieDetailViewController?
    private let movie: Movie
    
    init(presenter: UINavigationController, movie: Movie) {
        self.presenter = presenter
        self.movie = movie
    }
    
    func start() {
        let movieDetailViewController = MovieDetailViewController()
        movieDetailViewController.movie = movie
        self.movieDetailViewController = movieDetailViewController
        
        presenter.pushViewController(movieDetailViewController, animated: true)
    }
}
