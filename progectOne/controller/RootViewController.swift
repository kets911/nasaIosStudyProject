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
    var apods = [Apod]()
    var apodDtos = [ApodDto]()
    
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
    
    func goToMainScreen() {
        let someController = UINavigationController(rootViewController: SomeController())
         
        addChild(someController)
        someController.view.frame = view.bounds
        view.addSubview(someController.view)
        someController.didMove(toParent: self)
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        current = someController
    }
    
    func goToArtistInfoScreen(index: IndexPath) {
        Task {
            do {
                print("apodService created")
                let apodService = APODService()
                apodDtos = try await apodService.getApodDtoList()
                print("apodDtos.count is \(apodDtos.count)")
                for apodDto in apodDtos {
                    let data = try await apodService.getImage(url: apodDto.url!)
                    print("imageConvert-> ApodDto: \(apodDto)")
                    print("imageConvert-> apods.count: \(self.apods.count)")
                    print("imageConvert-> self.nibName: \(self.nibName)")
                    let im = UIImage(data: data!)
                    print("image is empty \(im?.debugDescription)")
                    let apod = Apod(title: apodDto.title!, image: im!, description: apodDto.explanation!)
                    self.apods.append(apod)
                }
                
                print("apods finally a \(apods.count)")
                
                screenTransition(viewController: ApodInfoController())
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
    
    private func screenTransition(viewController: UIViewController) {
        let targetController = UINavigationController(rootViewController: viewController)
         
        addChild(targetController)
        targetController.view.frame = view.bounds
        view.addSubview(targetController.view)
        targetController.didMove(toParent: self)
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        current = targetController
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
