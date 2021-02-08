//
//  MovieListCoordinator.swift
//  MovieCoordinator
//
//  Created by Samuel Folledo on 2/8/21.
//  Copyright © 2021 Alfian Losari. All rights reserved.
//

import UIKit

class MovieListCoordinator: Coordinator {
    
    private var presenter: UINavigationController
    private var movieDetailCoordinator: MovieDetailCoordinator?
    private var movieListViewController: MovieListViewController?
    private var movies: [Movie]
    
    init(presenter: UINavigationController, movies: [Movie]) {
        self.presenter = presenter
        self.movies = movies
    }
    
    func start() {
        let movieListViewController = MovieListViewController()
        movieListViewController.movies = movies
        movieListViewController.delegate = self
        
        self.movieListViewController = movieListViewController
        presenter.pushViewController(movieListViewController, animated: true)
    }
}

extension MovieListCoordinator: MovieListViewControllerDelegate {
    
    func movieListViewController(_ controller: MovieListViewController, didSelect movie: Movie) {
        let movieDetailCoordinator = MovieDetailCoordinator(presenter: presenter, movie: movie)
        self.movieDetailCoordinator = movieDetailCoordinator
        movieDetailCoordinator.start()
    }
}
