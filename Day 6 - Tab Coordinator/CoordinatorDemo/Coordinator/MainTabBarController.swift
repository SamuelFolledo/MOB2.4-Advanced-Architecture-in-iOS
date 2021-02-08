//
//  MainTabBarController.swift
//  CoordinatorDemo
//
//  Created by Adriana González Martínez on 2/7/21.
//

import UIKit

class MainTabBarController: UITabBarController {

    var home : HomeCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = HomeVC()
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        home = HomeCoordinator(navigationController: NavigationController(rootViewController: homeVC))
        
        viewControllers = [home.navigationController]
    }
    


}
