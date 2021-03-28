//
//  SecondViewController.swift
//  Instagram_2
//
//  Created by 최광호 on 2021/03/28.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    let TestView : UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()

    let btnTest : UIButton = {
       let btn = UIButton()
        btn.backgroundColor = .red
        btn.setTitle("눌러", for: .normal)
        btn.addTarget(self, action: #selector(didTapView), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(TestView)
        TestView.backgroundColor = .gray
        TestView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo((self.view.snp.height))
        }

        view.addSubview(btnTest)
        btnTest.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerY.centerX.equalToSuperview()
        }
    }

    @objc private func didTapView() {
        let Test = ThirdViewController()
        let Navvc = UINavigationController(rootViewController: Test)
        Test.title = "되냐?"
        Navvc.modalPresentationStyle = .fullScreen
        present(Navvc, animated: true)
    }
}
