//
//  ViewController.swift
//  Instagram
//
//  Created by 최광호 on 2021/03/10.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let userName = ["eofjh_123", "hfdkl_.das", "ahsdk12jdl__", "iue9u2", "ndc._.ew", "ehq2312"]
    let userPictureName = ["만리장성.jpg","베이징.jpg","병마.jpg","중국 운남산.jpg","판다.jpg","shop.jpg"]
    let myProfile: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .cyan
        btn.imageEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
        btn.layer.cornerRadius = 20
        return btn
    }()
    let myTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorColor = .white
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupTableView()
    }
    
    func setupTableView() {
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        myTableView.delegate = self
        myTableView.dataSource = self
        self.view.addSubview(myTableView)
        
        myTableView.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
            make.top.equalToSuperview().offset(50)
        }
        myTableView.register(instagramContentCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userName.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let HeaderStoryVew: UIView = {
            let view = UIView()
            view.backgroundColor = .white
            return view
        }()
        let btnInstagram: UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(named: "InstagramLogo.png"), for: .normal)
            return btn
        }()
        let btnUploadStory: UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(named: "camera.png"), for: .normal)
            return btn
        }()
        let btnCheckFeed: UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(named: "heartUpdate.png"), for: .normal)
            return btn
        }()
        let btnSendMessage: UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(named: "Message.png"), for: .normal)
            return btn
        }()
    
        HeaderStoryVew.addSubview(btnInstagram)
        HeaderStoryVew.addSubview(btnUploadStory)
        HeaderStoryVew.addSubview(btnCheckFeed)
        HeaderStoryVew.addSubview(btnSendMessage)
        
        btnInstagram.snp.makeConstraints { (make) in
            make.width.equalTo(140)
            make.height.equalTo(40)
            make.centerY.equalTo(HeaderStoryVew.snp.centerY)
            make.left.equalTo(HeaderStoryVew.snp.left).offset(10)
        }
        btnUploadStory.snp.makeConstraints { (make) in
            make.width.equalTo(35)
            make.height.equalTo(35)
            make.centerY.equalTo(HeaderStoryVew.snp.centerY).offset(-1)
            make.right.equalTo(btnCheckFeed.snp.left).offset(-20)
        }
        btnCheckFeed.snp.makeConstraints { (make) in
            make.width.equalTo(35)
            make.height.equalTo(35)
            make.centerY.equalTo(HeaderStoryVew.snp.centerY)
            make.right.equalTo(btnSendMessage.snp.left).offset(-15)
        }
        btnSendMessage.snp.makeConstraints { (make) in
            make.width.equalTo(33)
            make.height.equalTo(33)
            make.centerY.equalTo(HeaderStoryVew.snp.centerY).offset(-2)
            make.right.equalTo(HeaderStoryVew.snp.right).offset(-20)
        }
        return HeaderStoryVew
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! instagramContentCell
        cell.backgroundColor = .white
        cell.NameCell.text = userName[indexPath.row]
        cell.pictureCell.image = UIImage(named: userPictureName[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 700
//        UITableViewAutomatic 알아보기 self sizing
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let FooterInSection: UIView = {
            let view = UIView()
            view.backgroundColor = .white
            return view
        }()
        let btnGoToHome: UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(named: "home.png"), for: .normal)
            return btn
        }()
        let btnGoToMagnifyingGlass: UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(named: "magnifying-glass.png"), for: .normal)
            return btn
        }()
        let btnGoToLilles: UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(named: "IPTV.png"), for: .normal)
            return btn
        }()
        let btnGotoShop: UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(named: "multiUpdate.png"), for: .normal)
            return btn
        }()

        FooterInSection.addSubview(btnGoToHome)
        FooterInSection.addSubview(btnGoToMagnifyingGlass)
        FooterInSection.addSubview(btnGoToLilles)
        FooterInSection.addSubview(btnGotoShop)
        
        btnGoToHome.snp.makeConstraints { (make) in
            make.height.width.equalTo(40)
            make.top.equalTo(FooterInSection.snp.top).offset(5)
            make.left.equalTo(FooterInSection.snp.left).offset(20)
        }
        btnGoToMagnifyingGlass.snp.makeConstraints { (make) in
            make.height.width.equalTo(35)
            make.top.equalTo(btnGoToHome.snp.top).offset(5)
            make.right.equalTo(btnGoToLilles.snp.left).offset(-40)
        }
        btnGoToLilles.snp.makeConstraints { (make) in
            make.height.width.equalTo(40)
            make.centerX.equalTo(FooterInSection.snp.centerX)
            make.top.equalTo(FooterInSection.snp.top).offset(5)
        }
        btnGotoShop.snp.makeConstraints { (make) in
            make.height.width.equalTo(40)
            make.top.equalTo(btnGoToHome.snp.top).offset(5)
            make.left.equalTo(btnGoToLilles.snp.right).offset(40)
        }
        FooterInSection.addSubview(myProfile)
        myProfile.snp.makeConstraints { (make) in
            make.top.equalTo(btnGoToHome.snp.top).offset(5)
            make.width.height.equalTo(35)
            make.right.equalTo(FooterInSection.snp.right).offset(-20)
        }
    return FooterInSection
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 80
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
            make.width.height.equalToSuperview()
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

#if DEBUG

import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // leave this empty
    }
    @available( ios 14.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        ViewController()
    }
}
    @ available( ios 14.0, *)
    struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
        static var previews: some View {
            Group {
                ViewControllerRepresentable()
                    .ignoresSafeArea()
                    .previewDisplayName("Praview")
                    .previewDevice(PreviewDevice(rawValue: "iphone 11"))
            }
        }
    } #endif

