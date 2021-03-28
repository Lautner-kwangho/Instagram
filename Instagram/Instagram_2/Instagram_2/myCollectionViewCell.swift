//
//  CollectionViewCellViewFive.swift
//  Instagram_2
//
//  Created by 최광호 on 2021/03/25.
//

import UIKit

//View Five CollectionViewCell

class MyCollectionViewCell: UICollectionViewCell {
    static let identifier = "MyCollectionViewCell"

    let myImage: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .link
        addSubview(myImage)
        myImage.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
        }
        let images = [
            UIImage(named: "tiger.jpg"),
            UIImage(named: "만리장성.jpg")
        ].compactMap({ $0 })
        myImage.image = images.randomElement()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
