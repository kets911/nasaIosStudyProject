//
//  ArtistInfoController.swift
//  progectOne
//
//  Created by Кацуба Павел Васильевич on 09.01.2022.
//

import Foundation
import UIKit

class ApodInfoController: UIViewController {
    let index: IndexPath = IndexPath(row: 0, section: 7)
//    Should be async???
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let root = UIApplication.shared.windows.first?.rootViewController as? RootViewController
        
        print("apods finally a \(root?.apods.count)")
        
        // TODO add some views with info
        let label = UILabel()
        label.text = root?.apods[0].title
        label.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImageView(image: root?.apods[0].image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.frame = CGRect(x: 0, y: 20, width: 100, height: 200)
        view.addSubview(label)
        view.addSubview(image)
        view.backgroundColor = .gray
    }
    
//    private func imageConvert(apodDto dto: ApodDto) -> (Data) -> Void {
//        print("ApodInfoController-> ApodDto: \(dto)")
//        print("ApodInfoController-> apods.count: \(apods.count)")
//        return {data in
//            print("imageConvert-> ApodDto: \(dto)")
//            print("imageConvert-> apods.count: \(self.apods.count)")
//            print("imageConvert-> self.nibName: \(self.nibName)")
//            let apod = Apod(title: dto.title, image: UIImage(data: data)!, description: dto.explanation)
//            self.apods.append(apod)
//        }
//    }
    
    
    
//    apodService.getApodDtoList { apodDtos in
//        print("getApodDtoList closure start")
//        print(apodDtos.count)
//        self.apodDtos = apodDtos
//        print("parsm:\(apodDtos.count) and controller var:\(self.apodDtos.count)")
//
//    }
//    print("self.apodDtos.count is \(apodDtos.count)")
//    for apodDto in apodDtos {
//        apodService.getImage(url: apodDto.url) { data in
//            print("imageConvert-> ApodDto: \(apodDto)")
//            print("imageConvert-> apods.count: \(self.apods.count)")
//            print("imageConvert-> self.nibName: \(self.nibName)")
//            let im = UIImage(data: data)
//            print("image is empty \(im?.debugDescription)")
//            let apod = Apod(title: apodDto.title, image: im!, description: apodDto.explanation)
//            self.apods.append(apod)
//        }
//    }
}
