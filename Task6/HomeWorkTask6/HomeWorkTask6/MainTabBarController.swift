//
//  ViewController.swift
//  HomeWorkTask6
//
//  Created by Oleg Stepanov on 09.03.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureTabBarController()
    }
    
    override func viewDidLayoutSubviews() {
        if UIDevice.current.orientation.isLandscape {
            tabBar.backgroundColor = .systemMint
        } else {
            tabBar.backgroundColor = .systemYellow
        }
    }
    
    
    private func configureTabBarController() {
        let autoLayoutVC = UINavigationController(rootViewController: AutoLayoutViewController())
        let xibVC = UINavigationController(rootViewController: XIBViewController())
        let manualVC = UINavigationController(rootViewController: ManualViewController())
        let navigationVC = NavigationViewController()
        let largeVC = UINavigationController(rootViewController: LargeNavigationViewController())
        
        let autoLayoutIcon = UITabBarItem(title: "AutoLayout",
                                          image: UIImage(systemName: "arrow.left.and.right.righttriangle.left.righttriangle.right"),
                                          selectedImage: UIImage(systemName: "arrow.left.and.right.righttriangle.left.righttriangle.right.fill"))
        let xibIcon = UITabBarItem(title: "XIB",
                                   image: UIImage(systemName: "paintbrush.pointed"),
                                   selectedImage: UIImage(systemName: "paintbrush.pointed.fill"))
        let manualIcon = UITabBarItem(title: "Manual", image: UIImage(systemName: "book"), selectedImage: UIImage(systemName: "book.fill"))
        let navIcon = UITabBarItem(title: "Navigation",
                                   image: UIImage(systemName: "location"),
                                   selectedImage: UIImage(systemName: "location.fill"))
        let largeIcon = UITabBarItem(title: "Large navigation",
                                     image: UIImage(systemName: "arrowshape.zigzag.right"),
                                     selectedImage: UIImage(systemName: "arrowshape.zigzag.right.fill"))
        
        autoLayoutVC.tabBarItem = autoLayoutIcon
        xibVC.tabBarItem = xibIcon
        manualVC.tabBarItem = manualIcon
        navigationVC.tabBarItem = navIcon
        largeVC.tabBarItem = largeIcon
        
        let controllers = [autoLayoutVC, xibVC, manualVC, navigationVC, largeVC]
        
        tabBar.tintColor = .systemPink
        tabBar.backgroundColor = .systemYellow
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 3
        tabBar.layer.shadowColor = UIColor.gray.cgColor
        tabBar.layer.shadowOpacity = 0.7
        self.viewControllers = controllers
    }
    
}

