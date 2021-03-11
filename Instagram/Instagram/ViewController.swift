//
//  ViewController.swift
//  Instagram
//
//  Created by 최광호 on 2021/03/10.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
// basic Background
    lazy var Background = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
// snapKit prepare
// 인스타그램 타이틀 입력
    lazy var titleBox = { () -> UIView in
       let view = UIView()
        view.backgroundColor = .blue
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
// 스토리 나오는 공간
    lazy var storyBox = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
// 콘텐츠 나오는 공간
    let contentBox = UIScrollView()
    let contentView = UIView()
    let content1 = UIView()
    let content2 = UIView()
    let content3 = UIView()
    let content4 = UIView()
    let content5 = UIView()
    
    lazy var pageBox = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
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
//        titleBox.addSubview(InstagramTxt)
//        InstagramTxt.snp.makeConstraints { (make) in
//            make.width.equalToSuperview().dividedBy(1.1)
//            make.centerX.top.bottom.equalToSuperview()
//        }
// Story Scroll WORKSPACE
        self.view.addSubview(storyBox)
        storyBox.snp.makeConstraints { (make) in
            make.top.equalTo(titleBox.snp.bottom).offset(5)
            make.width.equalToSuperview()
            make.height.equalTo(60)
        }

        
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
        
        content1.backgroundColor = .red
        content2.backgroundColor = .blue
        content3.backgroundColor = .gray
        content4.backgroundColor = .darkGray
        content5.backgroundColor = .lightGray

        
        content1.snp.makeConstraints { (make) in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(250)
        }
        
        content2.snp.makeConstraints { (make) in
            make.top.equalTo(content1.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(250)
        }
        
        content3.snp.makeConstraints { (make) in
            make.top.equalTo(content2.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(250)
        }
        
        content4.snp.makeConstraints { (make) in
            make.top.equalTo(content3.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(250)
        }
        
        content5.snp.makeConstraints { (make) in
            make.top.equalTo(content4.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(250)
            make.bottom.equalToSuperview()
        }
//
//        self.view.addSubview(Background)
//
//        self.view.addSubview(pageBox)
//
//        Background.snp.makeConstraints { (make) in
//            make.edges.equalTo(self.view)
//        }
//
//// snapKit workspace
//        titleBox.snp.makeConstraints { (make) in
//            make.width.equalTo(Background.snp.height)
//            make.height.equalTo(70)
//        }
//
//        storyBox.snp.makeConstraints { (make) in
//            make.width.height.equalTo(titleBox)
//            make.top.equalTo(titleBox.snp.bottom)
//        }
//
//        pageBox.snp.makeConstraints { (make) in
//            make.width.height.equalTo(titleBox)
//            make.top.equalTo(contentBox.snp.bottom)
//        }
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
