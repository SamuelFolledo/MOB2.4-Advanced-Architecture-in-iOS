//
//  HomeVC.swift
//  CoordinatorDemo
//
//  Created by Adriana González Martínez on 2/7/21.
//

import UIKit

class HomeVC: UIViewController {
    
    var coordinator: HomeCoordinator?

    let searchBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Search Now", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.isUserInteractionEnabled = true
        return btn
    }()
    
    let resultLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Home"
        self.view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        
        setSearchButton()
        setResultLabel()
        
    }

    func setSearchButton(){
        searchBtn.addTarget(self, action: #selector(self.searchButtonPressed), for: .touchUpInside)
        self.view.addSubview(searchBtn)
        NSLayoutConstraint.activate([
            searchBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            searchBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    func setResultLabel(){
        self.view.addSubview(resultLabel)
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: searchBtn.bottomAnchor, constant: 20),
            resultLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }

    @objc func searchButtonPressed(){
        coordinator?.goSearch()
    }
    
    func search(value: String){
        resultLabel.text = value
    }
}

