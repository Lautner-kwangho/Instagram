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
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .link
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
