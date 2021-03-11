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
    lazy var titleBox = { () -> UILabel in
       let view = UILabel()
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var storyBox = { () -> UILabel in
        let view = UILabel()
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var contentBox = { () -> UILabel in
        let view = UILabel()
        view.backgroundColor = .darkGray
        return view
    }()
    
    lazy var pageBox = { () -> UILabel in
        let view = UILabel()
        view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.addSubview(Background)
        
        self.view.addSubview(titleBox)
        self.view.addSubview(storyBox)
        self.view.addSubview(contentBox)
        self.view.addSubview(pageBox)
        
        Background.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
// snapKit workspace
        titleBox.snp.makeConstraints { (make) in
            make.width.equalTo(Background.snp.height)
            make.height.equalTo(70)
        }
        
        storyBox.snp.makeConstraints { (make) in
            make.width.height.equalTo(titleBox)
            make.top.equalTo(titleBox.snp.bottom)
        }
        
        contentBox.snp.makeConstraints { (make) in
            make.width.equalTo(titleBox.snp.width)
            make.height.equalTo(Background.snp.height).dividedBy(1.7)
            make.top.equalTo(storyBox.snp.bottom)
        }
        
        pageBox.snp.makeConstraints { (make) in
            make.width.height.equalTo(titleBox)
            make.top.equalTo(contentBox.snp.bottom)
        }
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
