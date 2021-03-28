//
//  HeaderCollectionReusableView.swift
//  Instagram_2
//
//  Created by 최광호 on 2021/03/25.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "HeaderCollectionReusableView"
    
//    private let imageView: UIImageView = {
//      let imageView = UIImageView(image: UIImage(named: "중국 운남산.jpg"))
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        return imageView
//    }()
    
    private let Headview : UIView = {
       let view = UIView()
        return view
    }()
    private let viewSection1 : UIView = {
        let view = UIView()
        return view
    }()
    private let myProfile : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "storyStyle3.png"), for: .normal)
        btn.layer.cornerRadius = 60
        return btn
    }()
    private let myProfileCount : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.setTitle("게시물 & 팔로워 & 팔로우 \n 121        3312      3123", for: .normal)
        btn.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        btn.titleLabel?.textAlignment = NSTextAlignment.center
        btn.setTitleColor(.red, for: .normal)
        btn.layer.borderWidth = 2
        return btn
    }()
    private let viewSection2 : UIView = {
        let view = UIView()
        return view
    }()
    private let myProfileContent : UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.text = " test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test "
        view.numberOfLines = 5
        return view
    }()
    private let viewSection3 : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private let btnEdit : UIButton = {
       let btn = UIButton()
        btn.setTitle("프로필 편집", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.borderWidth = 2
        btn.backgroundColor = .clear
        return btn
    }()
    private let btnSaved : UIButton = {
       let btn = UIButton()
        btn.setTitle("저장됨", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.borderWidth = 2
        btn.backgroundColor = .clear
        return btn
    }()
    private let viewSection4 : UILabel = {
        let view = UILabel()
        view.text = "스토리 하이라이트"
        view.textColor = .black
        return view
    }()
    private let viewSection5 : UIView = {
        let view = UIView()
        return view
    }()
    private let btnPic : UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(named: "blackHeart.png"), for: .normal)
        return btn
    }()
    private let btnTag : UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(named: "homeUpdate.png"), for: .normal)
        return btn
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
//        addSubview(imageView)
        addSubview(Headview)
        Headview.addSubview(viewSection1)
        viewSection1.addSubview(myProfile)
        viewSection1.addSubview(myProfileCount)
        Headview.addSubview(viewSection2)
        viewSection2.addSubview(myProfileContent)
        Headview.addSubview(viewSection3)
        viewSection3.addSubview(btnEdit)
        viewSection3.addSubview(btnSaved)
        Headview.addSubview(viewSection4)
        Headview.addSubview(viewSection5)
        viewSection5.addSubview(btnPic)
        viewSection5.addSubview(btnTag)
        layoutSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        imageView.frame = bounds
        Headview.frame = bounds
        viewSection1.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(120)
            make.top.equalTo(Headview.snp.top)
        }
        myProfile.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerY.equalTo(viewSection1.snp.centerY)
            make.left.equalTo(viewSection1.snp.left).offset(10)
        }
        myProfileCount.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(100)
            make.centerY.equalTo(viewSection1.snp.centerY)
            make.right.equalTo(viewSection1.snp.right).offset(-50)
        }
        viewSection2.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(150)
            make.top.equalTo(viewSection1.snp.bottom)
        }
        myProfileContent.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
        }
        viewSection3.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(40)
            make.top.equalTo(viewSection2.snp.bottom)
        }
        btnEdit.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(40)
            make.centerY.equalTo(viewSection3.snp.centerY)
            make.centerX.equalToSuperview().offset(-103)
        }
        btnSaved.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(40)
            make.centerY.equalTo(viewSection3.snp.centerY)
            make.centerX.equalToSuperview().offset(103)
        }
        viewSection4.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(40)
            make.top.equalTo(viewSection3.snp.bottom)
            make.left.equalToSuperview().offset(10)
        }
        viewSection5.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(40)
            make.top.equalTo(viewSection4.snp.bottom)
        }
        btnPic.snp.makeConstraints { (make) in
            make.width.height.equalTo(35)
            make.centerY.equalTo(viewSection5.snp.centerY)
            make.centerX.equalToSuperview().offset(-103)
        }
        btnTag.snp.makeConstraints { (make) in
            make.width.height.equalTo(35)
            make.centerY.equalTo(viewSection5.snp.centerY)
            make.centerX.equalToSuperview().offset(103)
        }
    }

    func configure(with showColor: Bool) {
//        if showColor {
//            imageView.isHidden = true
//            backgroundColor = .systemRed
//        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
