//
//  MovieListViewControllerDelegate.swift
//  MovieCoordinator
//
//  Created by Samuel Folledo on 2/8/21.
//  Copyright © 2021 Alfian Losari. All rights reserved.
//

import Foundation

//Question: Why do we need class at the end of this protocol? Why would the delegate in ViewController need a weak in it?
protocol MovieListViewControllerDelegate: class {
    func movieListViewController(_ controller: MovieListViewController, didSelect movie: Movie)
}
