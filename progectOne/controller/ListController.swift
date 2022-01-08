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
        cell.title.text = item.title
        
        cell.backgroundColor = .green
        print("insex: \(indexPath), item: \(item), cell: \(cell)")
        return cell
    }
    // swiftlint:enable force_cast
}

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
