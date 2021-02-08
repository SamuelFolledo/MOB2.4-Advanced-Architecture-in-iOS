//
//  NavigationController.swift
//  CoordinatorDemo
//
//  Created by Adriana González Martínez on 2/7/21.
//

import UIKit

public class NavigationController: UINavigationController, UINavigationControllerDelegate
{
    private var completion: (() -> Void)?

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool){
        if self.completion != nil {
            DispatchQueue.main.async(execute: {
                self.completion?()
                self.completion = nil
            })
        }
    }

    func popViewController(animated: Bool, completion: @escaping () -> Void)
    {
        self.completion = completion
        super.popViewController(animated: animated)
    }
}
