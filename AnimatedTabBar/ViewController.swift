//
//  ViewController.swift
//  AnimatedTabBar
//
//  Created by Alina Sokolova on 19.01.22.
//

import UIKit
import RAMAnimatedTabBarController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        button.setTitle("Show Animated Tab Bar", for: .normal)
        button.backgroundColor = .darkGray
        button.center = view.center
        view.addSubview(button)
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        
    }
    @objc func tappedButton() {
        let tabBarVC = CustomTabBarController()
        present(tabBarVC, animated: true)
    }


}

class CustomTabBarController: RAMAnimatedTabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configure()
        
    }
    
    func configure(){
        let firstVC = UIViewController()
        let secondVC = UIViewController()
        
        firstVC.view.backgroundColor = .blue
        secondVC.view.backgroundColor = .red
        
        firstVC.tabBarItem.badgeColor = .black
        secondVC.tabBarItem.badgeColor = .black
        
        firstVC.tabBarItem = RAMAnimatedTabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        secondVC.tabBarItem = RAMAnimatedTabBarItem(title: "Flights", image: UIImage(systemName: "airplane"), tag: 1)
        
        (firstVC.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMBounceAnimation()
        (secondVC.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMFumeAnimation()
        
        setViewControllers([firstVC, secondVC], animated: false)
        
    }
}

