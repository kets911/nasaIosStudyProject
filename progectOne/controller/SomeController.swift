//
//  SomeController.swift
//  progectOne
//
//  Created by Кацуба Павел Васильевич on 07.01.2022.
//

import Foundation
import UIKit

class SomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("------> viewDidLoad")
        // Do any additional setup after loading the view.
        
        let sysBtn: UIButton = createWithAutoresizing(view: UIButton(type: .system))
        sysBtn.setTitle("system", for: .normal)
        sysBtn.backgroundColor = .white
        sysBtn.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        view.addSubview(sysBtn)
        setBtnConstraints(btn: sysBtn, centerAnch: CGFloat(-100.0))
    }

    private func createWithAutoresizing<T: UIView>(view: T) -> T {
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    @objc func buttonClicked() {
         print("------> Button Click")
        
        let viewController = UIApplication.shared.windows.first?.rootViewController as? RootViewController
        print("------> UIApplication.shared.windows.first!.rootViewController as? RootViewController return is \(viewController)")
        viewController?.goToListScreen()
//        AppDelegate.shared.rootViewController.[someMethod]()
    }
    
    private func setBtnConstraints(btn: UIButton, centerAnch: CGFloat) {
        btn.topAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centerAnch).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
}
