//
//  SearchVC.swift
//  CoordinatorDemo
//
//  Created by Adriana González Martínez on 2/7/21.
//

import UIKit

protocol SearchDelegate: AnyObject {
    func searchFor(value:String)
}

class SearchVC: UIViewController {

    var coordinator: HomeCoordinator?
    var delegate: SearchDelegate?
    
    let startBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Search", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Search"
        self.view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        setStartSearchButton()
    }
    
    func setStartSearchButton(){
        startBtn.addTarget(self, action: #selector(self.searchButtonPressed), for: .touchUpInside)
        self.view.addSubview(startBtn)
        NSLayoutConstraint.activate([
            startBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            startBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }

    @objc func searchButtonPressed(){
        if let nav = self.navigationController as? NavigationController {
            nav.popViewController(animated: true, completion: { [self] in
                self.delegate?.searchFor(value: "Some Value :)")
            })
        }
    }
}
