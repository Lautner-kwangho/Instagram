//
//  ViewController.swift
//  Instagram
//
//  Created by 최광호 on 2021/03/10.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
///  --------------------------------------------------------------------------------
// snapKit prepare
// 인스타그램 타이틀 입력
    lazy var titleBox = { () -> UIView in
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
// 그림 로고를 넣는 방법이 있었지... 굳이 글자에 폰트 안넣고...
//    lazy var InstagramTxt = { () -> UILabel in
//        let view = UILabel()
//        view.text = "Instagram"
//        view.textColor = .black
//        view.font = .boldSystemFont(ofSize: 20)
//        view.font = UIFont(name: , size: 15)
//        return view
//    }()
    lazy var btnGramImage = { () -> UIButton in
       let view = UIButton()
        view.setImage(UIImage(named: "InstagramLogo.png"), for: .normal)
        return view
    }()
    
    lazy var btnUploadImg = { () -> UIButton in
        let view = UIButton()
        view.setImage(UIImage(named: "upload.png"), for: .normal)
        return view
    }()
    
    lazy var btnHeartImg = { () -> UIButton in
        let view = UIButton()
        view.setImage(UIImage(named: "heart.png"), for: .normal)
        return view
    }()

    lazy var btnMessageImg = { () -> UIButton in
        let view = UIButton()
        view.setImage(UIImage(named: "Message.png"), for: .normal)
        return view
    }()
///  --------------------------------------------------------------------------------
// 스토리 나오는 공간
    let storyBox = UIView()
    
//    struct storyBox: View {
//        var body: some View {
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack {
//                }
//            }
//        }
//    }
    
    let storyView = UIScrollView()
    let myStory = UIView()
    let story1 = UIView()
    let story2 = UIView()
    let story3 = UIView()
    let story4 = UIView()
///  --------------------------------------------------------------------------------
// 콘텐츠 나오는 공간
    let contentBox = UIScrollView()
    let contentView = UIView()
    let content1 = UIView()
    let nameLine1 = UIView()
    let profileImg = UIView()
    let profiletxt = UILabel()
    let profileAdd = UIButton()
    lazy var picLine1 = { () -> UIButton in
        let view = UIButton()
        view.setImage(UIImage(named: "shop.jpg"), for: .normal)
        return view
    }()
    let funLine1 = UIView()
    lazy var btnLike1 = {() -> UIButton in
        let view = UIButton()
        view.setImage(UIImage(named: "heart.png"), for: .normal)
        return view
    }()
    lazy var btnReply1 = {() -> UIButton in
        let view = UIButton()
        view.setImage(UIImage(named: "comment.png"), for: .normal)
        return view
    }()
    lazy var btnSendMessage1 = {() -> UIButton in
        let view = UIButton()
        view.setImage(UIImage(named: "Message.png"), for: .normal)
        return view
    }()
    lazy var btnSaveContent1 = {() -> UIButton in
        let view = UIButton()
        view.setImage(UIImage(named: "save.png"), for: .normal)
        return view
    }()
    let statusLine1 = UILabel()
    let workLine1 = UILabel()
    let replyLine1 = UIView()
    let myStoryMulti1 = UIButton()
    let lblRePly = UITextField()
    let timeLine1 = UILabel()

///  --------------------------------------------------------------------------------
    let content2 = UIView()
    lazy var picLine2 = { () -> UIButton in
        let view = UIButton()
        view.setImage(UIImage(named: "tiger.jpg"), for: .normal)
        return view
    }()
    let content3 = UIView()
    let content4 = UIView()
    let content5 = UIView()
///  --------------------------------------------------------------------------------
    lazy var pageBox = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var btnHome = {() -> UIButton in
        let view = UIButton()
        view.setImage(UIImage(named: "home.png"), for: .normal)
        return view
    }()
    lazy var btnMagifying = {() -> UIButton in
        let view = UIButton()
        view.setImage(UIImage(named: "magnifying-glass.png"), for: .normal)
        return view
    }()
    lazy var btnSetting = {() -> UIButton in
        let view = UIButton()
        view.setImage(UIImage(named: "setting.png"), for: .normal)
        return view
    }()
    lazy var btnProfile = {() -> UIButton in
        let view = UIButton()
        view.setImage(UIImage(named: "tiger.jpg"), for: .normal)
        return view
    }()
///  --------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

// TitleBox WORKSPACE
        self.view.addSubview(titleBox)
        titleBox.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(35)
            make.width.equalToSuperview()
            make.height.equalTo(40)
        }
        funcTitleBox()
       
// Story Scroll WORKSPACE
        self.view.addSubview(storyBox)
        storyBox.snp.makeConstraints { (make) in
            make.top.equalTo(titleBox.snp.bottom)
            make.height.equalTo(80)
            make.width.equalToSuperview()
        }
        funcStoryBox()

// Content Scroll WORKSPACE
        self.view.addSubview(contentBox)
        contentBox.snp.makeConstraints { (make) in
            make.top.equalTo(storyBox.snp.bottom).offset(5)
            make.height.equalTo(700)
            make.width.equalToSuperview()
        }
        
        contentBox.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
        
        _ = [content1,content2,content3,content4,content5].map { self.contentView.addSubview($0) }
        
        content1.backgroundColor = .clear
        content2.backgroundColor = .blue
        content3.backgroundColor = .gray
        content4.backgroundColor = .darkGray
        content5.backgroundColor = .lightGray

        funcContent1()
        funcContent2()
        funcContent3()
        funcContent4()
        funcContent5()
// Page Shift WORKSPACE
        self.view.addSubview(pageBox)
        pageBox.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalToSuperview()
        }
        
        funcPage()
    }
/// --------------------------------------------------------------------------------------
    func funcTitleBox() {
        titleBox.addSubview(btnGramImage)
        btnGramImage.snp.makeConstraints { (make) in
            make.left.equalTo(titleBox.snp.left).offset(10)
            make.centerY.equalTo(titleBox.snp.centerY)
            make.width.equalTo(titleBox.snp.width).dividedBy(4)
            make.height.equalTo(35)
        }
        titleBox.addSubview(btnMessageImg)
        btnMessageImg.snp.makeConstraints { (make) in
            make.right.equalTo(titleBox.snp.right).offset(-15)
            make.centerY.equalTo(titleBox.snp.centerY)
            make.width.height.equalTo(titleBox.snp.height).dividedBy(1.5)
        }
        titleBox.addSubview(btnHeartImg)
        btnHeartImg.snp.makeConstraints { (make) in
            make.right.equalTo(btnMessageImg.snp.left).offset(-15)
            make.centerY.equalTo(titleBox.snp.centerY)
            make.width.height.equalTo(titleBox.snp.height).dividedBy(1.5)
        }
        titleBox.addSubview(btnUploadImg)
        btnUploadImg.snp.makeConstraints { (make) in
            make.right.equalTo(btnHeartImg.snp.left).offset(-15)
            make.centerY.equalTo(titleBox.snp.centerY)
            make.width.height.equalTo(titleBox.snp.height).dividedBy(1.5)
        }
///  --------------------------------------------------------------------------------
//        titleBox.addSubview(InstagramTxt)
//        InstagramTxt.snp.makeConstraints { (make) in
//            make.width.equalToSuperview().dividedBy(1.1)
//            make.centerX.top.bottom.equalToSuperview()
//        }
    }
    
    func funcStoryBox() {
        storyBox.addSubview(storyView)
        storyView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(storyBox.snp.height)
            make.top.equalTo(storyBox.snp.top)
        }
        storyView.alwaysBounceHorizontal = true
    
        _ = [myStory,story1,story2,story3,story4].map {self.storyView.addSubview($0)}
        
        myStory.backgroundColor = .yellow
        story1.backgroundColor = .gray
        story2.backgroundColor = .darkGray
        story3.backgroundColor = .systemGray
        story4.backgroundColor = .systemGray3
        
        myStory.snp.makeConstraints { (make) in
            make.width.height.equalTo(70)
            make.centerY.equalTo(storyView.snp.centerY)
        }
        myStory.layer.cornerRadius = 35
        
        story1.snp.makeConstraints { (make) in
            make.width.height.equalTo(70)
            make.centerY.equalTo(storyView.snp.centerY)
            make.left.equalTo(myStory.snp.right).offset(20)
        }
        story1.layer.cornerRadius = 35
        
        story2.snp.makeConstraints { (make) in
            make.width.height.equalTo(70)
            make.centerY.equalTo(storyView.snp.centerY)
            make.left.equalTo(story1.snp.right).offset(20)
        }
        story2.layer.cornerRadius = 35

        story3.snp.makeConstraints { (make) in
            make.width.height.equalTo(70)
            make.centerY.equalTo(storyView.snp.centerY)
            make.left.equalTo(story2.snp.right).offset(20)
        }
        story3.layer.cornerRadius = 35
        
        story4.snp.makeConstraints { (make) in
            make.width.height.equalTo(70)
            make.centerY.equalTo(storyView.snp.centerY)
            make.leading.equalTo(story3.snp.trailing).offset(20)
        }
        story4.layer.cornerRadius = 35
    }
    
    func funcContent1() {
        content1.snp.makeConstraints { (make) in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(650)
        }
        content1.addSubview(nameLine1)
        nameLine1.snp.makeConstraints { (make) in
            make.top.equalTo(content1.snp.top)
            make.height.equalTo(50)
            make.width.equalToSuperview()
        }
        
        nameLine1.addSubview(profileImg)
        profileImg.snp.makeConstraints { (make) in
            make.left.equalTo(nameLine1.snp.left).offset(10)
            make.height.width.equalTo(44)
        }
        profileImg.backgroundColor = .darkGray
        profileImg.layer.cornerRadius = 22
        
        nameLine1.addSubview(profiletxt)
        profiletxt.snp.makeConstraints { (make) in
            make.left.equalTo(profileImg.snp.right).offset(10)
            make.height.equalTo(nameLine1.snp.height)
            make.width.equalToSuperview()
        }
        profiletxt.text = "Tester_insta236"
        
        content1.addSubview(picLine1)
        picLine1.snp.makeConstraints { (make) in
            make.top.equalTo(nameLine1.snp.bottom).offset(2.5)
            make.height.equalTo(400)
            make.width.equalToSuperview()
        }
        
        content1.addSubview(funLine1)
        funLine1.snp.makeConstraints { (make) in
            make.top.equalTo(picLine1.snp.bottom)
            make.height.equalTo(50)
            make.width.equalToSuperview()
        }
        
        funLine1.addSubview(btnLike1)
        btnLike1.snp.makeConstraints { (make) in
            make.centerY.equalTo(funLine1.snp.centerY)
            make.top.equalTo(funLine1.snp.top)
            make.left.equalTo(funLine1.snp.left).offset(10)
            make.height.width.equalTo(40)
        }
        
        funLine1.addSubview(btnReply1)
        btnReply1.snp.makeConstraints { (make) in
            make.centerY.equalTo(btnLike1.snp.centerY)
            make.left.equalTo(btnLike1.snp.right).offset(10)
            make.height.width.equalTo(35)
        }
        
        funLine1.addSubview(btnSendMessage1)
        btnSendMessage1.snp.makeConstraints { (make) in
            make.centerY.equalTo(btnLike1.snp.centerY)
            make.left.equalTo(btnReply1.snp.right).offset(10)
            make.height.width.equalTo(40)
        }
        
        funLine1.addSubview(btnSaveContent1)
        btnSaveContent1.snp.makeConstraints { (make) in
            make.centerY.equalTo(btnLike1.snp.centerY)
            make.right.equalTo(funLine1.snp.right)
            make.height.width.equalTo(50)
        }
        
        content1.addSubview(statusLine1)
        statusLine1.snp.makeConstraints { (make) in
            make.top.equalTo(funLine1.snp.bottom).offset(-10)
            make.height.equalTo(50)
            make.width.equalToSuperview()
        }
//        workLine1.text = " 좋아요 /(count) 개"
        statusLine1.text = " 좋아요 5 개"
        
        content1.addSubview(workLine1)
        workLine1.snp.makeConstraints { (make) in
            make.top.equalTo(statusLine1.snp.bottom).offset(-10)
            make.height.equalTo(50)
            make.width.equalToSuperview()
        }
        let nameTxt = profiletxt.text!
        let contentTxt: String = " 오늘 인스타그램 test test \n #좋아요 #싫어요 #인스타그램"
        workLine1.text = "\(nameTxt)   \(contentTxt)"
        workLine1.numberOfLines = 4
        if workLine1.adjustsFontSizeToFitWidth == false {
            workLine1.adjustsFontSizeToFitWidth = true
        }

        content1.addSubview(replyLine1)
        replyLine1.snp.makeConstraints { (make) in
            make.top.equalTo(workLine1.snp.bottom)
            make.height.equalTo(45)
            make.width.equalToSuperview()
        }
        replyLine1.backgroundColor = .clear
        
        replyLine1.addSubview(myStoryMulti1)
        myStoryMulti1.snp.makeConstraints { (make) in
            make.centerY.equalTo(replyLine1.snp.centerY)
            make.height.width.equalTo(25)
            make.left.equalTo(replyLine1.snp.left).offset(10)
        }
        myStoryMulti1.backgroundColor = .yellow
        myStoryMulti1.layer.cornerRadius = 12.5
        
        replyLine1.addSubview(lblRePly)
        lblRePly.snp.makeConstraints { (make) in
            make.centerY.equalTo(replyLine1.snp.centerY)
            make.left.equalTo(replyLine1.snp.left).offset(40)
            make.height.width.equalToSuperview().dividedBy(1.3)
        }
        lblRePly.backgroundColor = .lightText
        lblRePly.text = " 댓글 입력 "
                
        content1.addSubview(timeLine1)
        timeLine1.snp.makeConstraints { (make) in
            make.top.equalTo(replyLine1.snp.bottom)
            make.height.equalTo(20)
            make.width.equalToSuperview()
        }
        timeLine1.text = "   4분 전 "
        timeLine1.textColor = .gray
        timeLine1.textAlignment = .natural
    }
    
    func funcContent2() {
        content2.snp.makeConstraints { (make) in
            make.top.equalTo(content1.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(600)
        }
        
        content2.addSubview(picLine2)
        picLine2.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func funcContent3() {
        content3.snp.makeConstraints { (make) in
            make.top.equalTo(content2.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(600)
        }
    }
    
    func funcContent4() {
        content4.snp.makeConstraints { (make) in
            make.top.equalTo(content3.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(600)
        }
    }
    
    func funcContent5() {
        content5.snp.makeConstraints { (make) in
            make.top.equalTo(content4.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(600)
            make.bottom.equalToSuperview()
        }
    }
    
    func funcPage() {
        pageBox.addSubview(btnHome)
        btnHome.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerY.equalTo(pageBox.snp.centerY)
            make.left.equalTo(pageBox.snp.left).offset(20)
            make.height.width.equalTo(pageBox.snp.height).dividedBy(1.2)
        }
        pageBox.addSubview(btnMagifying)
        btnMagifying.snp.makeConstraints { (make) in
            make.centerY.equalTo(pageBox.snp.centerY)
            make.left.equalTo(btnHome.snp.right).offset(60)
            make.height.width.equalTo(pageBox.snp.height).dividedBy(1.4)
        }
        pageBox.addSubview(btnSetting)
        btnSetting.snp.makeConstraints { (make) in
            make.centerY.equalTo(pageBox.snp.centerY)
            make.left.equalTo(btnMagifying.snp.right).offset(60)
            make.height.width.equalTo(pageBox.snp.height).dividedBy(1.3)
        }
        pageBox.addSubview(btnProfile)
        btnProfile.snp.makeConstraints { (make) in
            make.centerY.equalTo(pageBox.snp.centerY)
            make.left.equalTo(btnSetting.snp.right).offset(60)
            make.height.width.equalTo(pageBox.snp.height).dividedBy(1.2)
        }
        btnProfile.layer.cornerRadius = 50
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

