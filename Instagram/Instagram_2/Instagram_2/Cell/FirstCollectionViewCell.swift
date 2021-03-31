//
//  FirstCollectionViewCell.swift
//  Instagram_2
//
//  Created by 최광호 on 2021/03/28.
//

import UIKit
import SnapKit

class FirstCollectionViewCell: UICollectionViewCell {
    static let identifier = "FirstCollectionViewCell"
    
    lazy var btnStory: UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(named: "tiger.jpg"), for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(btnStory)
//        addSubview(btnStory)
        btnStory.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.top.leading.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
