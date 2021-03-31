//
//  InstagramContentCell.swift
//  Instagram_2
//
//  Created by 최광호 on 2021/03/28.
//

import SnapKit
import UIKit

class InstagramStoryCell: UITableViewCell{
    public lazy var myCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
       let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
       layout.scrollDirection = .horizontal
        view.isScrollEnabled = true
       layout.minimumLineSpacing = 20
        view.register(FirstCollectionViewCell.self, forCellWithReuseIdentifier: FirstCollectionViewCell.identifier)
       view.backgroundColor = .white
       return view
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        superCellView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func superCellView(){
        self.contentView.addSubview(myCollectionView)
        
        myCollectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.height.equalTo(100)
            $0.width.equalTo(430)
        }
    }
}

class instagramContentCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let NameCell: UILabel = {
       let label = UILabel()
        label.text = "userName"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.backgroundColor = .white
        return label
    }()
    let pictureCell: UIImageView = {
        var Image = UIImageView()
        Image.backgroundColor = .white
        Image.image = UIImage(named: "tiger.jpg")
//        Image.contentMode = .scaleAspectFit
        return Image
    }()
    let btnCell: UIView = {
        var btn = UIView()
        btn.backgroundColor = .white
        return btn
    }()
    let commentCell: UIView = {
        var btn = UIView()
        btn.backgroundColor = .white
        return btn
    }()
    let timeCell: UILabel = {
        let view = UILabel()
        view.backgroundColor = .white
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        superCellView()
    }
    
    func superCellView() {
        addSubview(cellView)
        cellView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.equalToSuperview()//.offset(80)
        }
        cellView.addSubview(NameCell)
        NameCell.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(cellView.snp.top)
            make.left.equalTo(cellView.snp.left).offset(10)
        }
        cellView.addSubview(pictureCell)
        pictureCell.snp.makeConstraints { (make) in
            make.top.equalTo(NameCell.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(450)
        }
        cellView.addSubview(btnCell)
        btnCellContent()
        btnCell.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(pictureCell.snp.bottom)
        }
        cellView.addSubview(commentCell)
        commentCellContent()
        commentCell.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(130)
            make.top.equalTo(btnCell.snp.bottom)
        }
        cellView.addSubview(timeCell)
        timeCellText()
        timeCell.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(20)
            make.top.equalTo(commentCell.snp.bottom)
        }
        
    }
    
    func btnCellContent() {
        let btnheart: UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(named: "heart.png"), for: .normal)
            return btn
        }()
        let btnComment: UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(named: "comment.png"), for: .normal)
            return btn
        }()
        let btnMessage: UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(named: "Message.png"), for: .normal)
            return btn
        }()
        let btnSave: UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(named: "save.png"), for: .normal)
            return btn
        }()
        btnCell.addSubview(btnheart)
        btnheart.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.centerY.equalTo(btnCell.snp.centerY)
            make.left.equalTo(btnCell.snp.left).offset(10)
        }
        btnCell.addSubview(btnComment)
        btnComment.snp.makeConstraints { (make) in
            make.height.equalTo(25)
            make.width.equalTo(25)
            make.centerY.equalTo(btnCell.snp.centerY)
            make.left.equalTo(btnheart.snp.right).offset(15)
        }
        btnCell.addSubview(btnMessage)
        btnMessage.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.centerY.equalTo(btnCell.snp.centerY)
            make.left.equalTo(btnComment.snp.right).offset(15)
        }
        btnCell.addSubview(btnSave)
        btnSave.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.centerY.equalTo(btnCell.snp.centerY)
            make.right.equalTo(btnCell.snp.right).offset(-10)
        }
    }
    
    func commentCellContent() {
        let likeCount: UILabel = {
            let label = UILabel()
            label.text = "  좋아요 5개"
            return label
        }()
        let name: UILabel = {
            let view = UILabel()
            view.text = "anonymous"
            return view
        }()
        let moreComment: UIButton = {
            let btn = UIButton()
            btn.setTitle("댓글 더 보기", for: UIControl.State.normal)
            return btn
        }()
        let inputComment: UIView = {
            let view = UIView()
            return view
        }()
        
        commentCell.addSubview(likeCount)
        commentCell.addSubview(name)
        commentCell.addSubview(moreComment)
        commentCell.addSubview(inputComment)
        
        likeCount.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.width.equalToSuperview()
            make.left.equalTo(commentCell.snp.left).offset(10)
        }
        name.snp.makeConstraints { (make) in
            make.height.equalTo(60)
            make.width.equalToSuperview()
            make.top.equalTo(likeCount.snp.bottom)
            make.left.equalTo(commentCell.snp.left).offset(10)
        }
        moreComment.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.width.equalToSuperview()
            make.top.equalTo(name.snp.bottom)
            make.left.equalTo(commentCell.snp.left).offset(10)
        }
        inputComment.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.width.equalToSuperview()
            make.top.equalTo(moreComment.snp.bottom)
            make.left.equalTo(commentCell.snp.left).offset(10)
        }
        let myComment: UITextField = {
            let comment = UITextField()
            comment.text = "input"
            return comment
            }()
        
            inputComment.addSubview(myComment)
        
            myComment.snp.makeConstraints { (make) in
                make.height.equalToSuperview()
                make.width.equalToSuperview()
                make.top.equalTo(inputComment.snp.top)
                }
            }
    
    func timeCellText() {
        timeCell.text = " 15분 전 "
        timeCell.snp.makeConstraints { (make) in
            make.rightMargin.equalToSuperview().offset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
