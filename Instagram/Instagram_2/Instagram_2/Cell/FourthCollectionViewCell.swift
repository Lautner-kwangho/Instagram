//
//  FourthControllerViewCell.swift
//  Instagram_2
//
//  Created by 최광호 on 2021/03/28.
//

import UIKit
import SnapKit

class FourthCollectionViewCell: UICollectionViewCell {
    static let identifier = "FourthCollectionViewCell"
    
    let imageView: UIImageView = {
       let image = UIImageView()
        image.backgroundColor = .green
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
        }
        
        let imagess = [
            UIImage(named: "만리장성.jpg"),
            UIImage(named: "베이징.jpg"),
            UIImage(named: "병마.jpg"),
            UIImage(named: "판다.jpg"),
            UIImage(named: "중국 운남산.jpg"),
        ].compactMap({$0})
        imageView.image = imagess.randomElement()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// test
