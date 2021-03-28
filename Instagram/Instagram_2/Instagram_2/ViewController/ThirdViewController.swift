//
//  ThirdViewController.swift
//  Instagram_2
//
//  Created by 최광호 on 2021/03/28.
//

import SnapKit
import UIKit
class ThirdViewController: UIViewController {
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        button.setTitle("테스트로 이동", for: .normal)
        view.addSubview(button)
        button.backgroundColor = .white
        button.setTitleColor(.blue, for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
        button.addTarget(self, action: #selector(gotoTest), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(TTTT))
    }
    
    @objc func gotoTest() {
        let TtestVC = TestViewController()
        navigationController?.pushViewController(TtestVC, animated: true)
    }
    
    @objc private func TTTT() {
        dismiss(animated: true, completion: nil)
    }
}
