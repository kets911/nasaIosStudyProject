//
//  ViewController.swift
//  progectOne
//
//  Created by Кацуба Павел Васильевич on 10.12.2021.
//

import UIKit

class RootViewController: UIViewController {
    var scoreLabel: UILabel!
    var score = 0
    
    private var current: UIViewController
       init() {
          self.current = SomeController()
          super.init(nibName: nil, bundle: nil)
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("------> viewDidLoad")
        // Do any additional setup after loading the view.
        
        addChild(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParent: self)
    }
    
    func goToListScreen() {
        let listController = UINavigationController(rootViewController: ListController())
        
        addChild(listController)
        listController.view.frame = view.bounds
        view.addSubview(listController.view)
        listController.didMove(toParent: self)
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        current = listController
    }
    
//    override func loadView() {
//        print("------> loadView")
//
//        scoreLabel = UILabel()
//        scoreLabel.textAlignment = .right
//        scoreLabel.text = "Score: \(score)"
//        view.addSubview(scoreLabel)
//
//        NSLayoutConstraint.activate([
//            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            scoreLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//           ])
//    }
}
