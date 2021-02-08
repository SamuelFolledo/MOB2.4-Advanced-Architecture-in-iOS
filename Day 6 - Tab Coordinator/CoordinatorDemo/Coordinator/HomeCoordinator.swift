//
//  MainCoordinator.swift
//  CoordinatorDemo
//
//  Created by Adriana González Martínez on 2/7/21.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    
    var navigationController: NavigationController
    private var rootVC: HomeVC?
    private var searchVC: SearchVC?

    init(navigationController: NavigationController) {
        self.navigationController = navigationController
        self.rootVC = navigationController.viewControllers.first as? HomeVC
        start()
    }

    func start() {
        rootVC!.coordinator = self
    }
    
    func goSearch(){
        searchVC = SearchVC()
        searchVC!.coordinator = self
        searchVC!.delegate = self
        navigationController.pushViewController(searchVC!, animated: true)
    }
}

extension HomeCoordinator: SearchDelegate{
    func searchFor(value: String) {
        rootVC?.search(value: value)
    }
}
