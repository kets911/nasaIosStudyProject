//
//  MainListCell.swift
//  progectOne
//
//  Created by Кацуба Павел Васильевич on 05.01.2022.
//

import Foundation
import UIKit

class MainListCell: UICollectionViewCell {
    let title = UILabel()
    let image = UIImage()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("MainListCell -> init with title: \(title)")
        contentView.addSubview(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("MainListCell -> layoutSubviews()")
        title.frame = contentView.bounds.inset(by: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
    }
}
