//
//  ListController.swift
//  progectOne
//
//  Created by Кацуба Павел Васильевич on 04.01.2022.
//

import UIKit

class ListController: UIViewController {
    private var items = [Item]()
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("------> viewDidLoad")
        // Do any additional setup after loading the view.
        
        collectionView.backgroundColor = .blue
        collectionView.register(MainListCell.self, forCellWithReuseIdentifier: "\(MainListCell.self)")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.reloadData()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.turn.up.left.fill"), style: .plain, target: self, action: #selector(goToRoot))
        
        let logoutButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goToRoot))
        navigationItem.setLeftBarButton(logoutButton, animated: true)
    }
    
    override func loadView() {
        print("------> loadView")
        view = UIView()
        view.addSubview(collectionView)
        
        items = (0..<50).map(String.init).map(Item.init)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews() set view.bounds to frame")
        collectionView.frame = view.bounds
    }
    
    @objc private func goToRoot() {
        print("------------- goToRoot()")
        let viewController = UIApplication.shared.windows.first?.rootViewController as? RootViewController
        viewController?.goToMainScreen()
    }
}

extension ListController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("extension UICollectionViewDataSource -> \(items.count)")
        return items.count
    }
    
    // swiftlint:disable force_cast
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        print("extension UICollectionViewDataSource -> second collectionView start")
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "\(MainListCell.self)", for: indexPath
        ) as! MainListCell
        let item = items[indexPath.row]
        
//        cell.title.text = item.title
//        cell.image.image = UIImage(systemName: "arrowshape.turn.up.left.fill")
        
        let title = UILabel(frame: CGRect(x: 110, y: 10, width: 200, height: 20))
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = item.title
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "arrowshape.turn.up.left.fill")
        cell.stack.addSubview(image)
        cell.stack.addSubview(title)
        // what is it 
        cell.stack.axis = .vertical
        cell.stack.spacing = 30
        
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        
        cell.backgroundColor = .green
        print("insex: \(indexPath), item: \(item), cell: \(cell)")
        return cell
    }
    // swiftlint:enable force_cast

    @objc func tap(_ sender: UITapGestureRecognizer) {

       let location = sender.location(in: self.collectionView)
       let indexPath = self.collectionView.indexPathForItem(at: location)

       if let index = indexPath {
           print("Got clicked on index: \(index)!")
           
           let rootVC = UIApplication.shared.windows.first?.rootViewController as? RootViewController
           rootVC?.goToArtistInfoScreen(index: index)
       }
    }
}

//extension ListController: UICollectionViewDelegate {
//    // called when clicked
//    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        print("Got clicked!")
//
//        let rootVC = UIApplication.shared.windows.first?.rootViewController as? RootViewController
//        rootVC?.goToArtistInfoScreen()
//    }
//}

extension ListController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        print("extension UICollectionViewDelegateFlowLayout -> collectionView")
        return CGSize(width: collectionView.bounds.width, height: 56)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        print("----------ОТСТУПЫ----------------")
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}
