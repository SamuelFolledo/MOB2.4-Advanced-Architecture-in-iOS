//
//  CoordinatorProtocol.swift
//  CoordinatorDemo
//
//  Created by Adriana González Martínez on 2/7/21.
//

import Foundation
import UIKit

protocol Coordinator {
    func start()
    var navigationController: NavigationController { get set }
}
