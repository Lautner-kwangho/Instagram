//
//  ViewController.swift
//  Instagram
//
//  Created by 최광호 on 2021/03/10.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let Login : UILabel = {
        let lbl = UILabel()
        lbl.text = "kwangho's Instagram 2.0"
        lbl.font = .boldSystemFont(ofSize: 30)
        return lbl
    }()
    
    
    private let btnLogin : UIButton = {
        let btn = UIButton()
        btn.setTitle("로그인하기", for: .normal)
        btn.backgroundColor = .systemOrange
        btn.addTarget(self, action: #selector(ClickLogin), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(Login)
        Login.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
        view.addSubview(btnLogin)
        btnLogin.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.top.equalTo(Login.snp.bottom).offset(10)
            make.centerX.equalTo(Login.snp.centerX)
        }
        view.backgroundColor = .white
    }
    
    @objc private func ClickLogin() {
        let TabBar = UITabBarController()
        
        let vc1 = FirstViewController()
        let vc2 = SecondViewController()
        let vc3 = ThirdViewController()
        let vc4 = FourthViewController()
        let vc5 = FifthViewController()
        
        vc1.title = "view1"
        vc2.title = "view2"
        vc3.title = "view3"
        vc4.title = "view4"
        vc5.title = "view5"
        
        TabBar.setViewControllers([vc1, vc2,vc3,vc4,vc5], animated: false)
        TabBar.modalPresentationStyle = .fullScreen
        
        guard let items = TabBar.tabBar.items else {
            return
        }
        
        let images = ["house", "bell", "person.circle", "star", "gear"]
        
        for x in 0 ..< items.count {
            items[1].badgeValue = "1"
            items[x].image = UIImage(systemName: images[x])
        }
        
        present(TabBar, animated: true)
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
        FourthViewController()
        return FourthViewController()
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

