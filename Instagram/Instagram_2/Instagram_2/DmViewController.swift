//
//  File.swift
//  Instagram_2
//
//  Created by 최광호 on 2021/03/22.
//

import UIKit
import SnapKit

class DmViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let DmMessageUser = ["경희", "쿠니🥰", "숭실", "레오🤩", "고대", "해피🤨","경희", "한양", "숭실", "서울", "고대", "연대"]
    var DmPictureColor = [UIColor.red, UIColor.blue, UIColor.cyan, UIColor.black, UIColor.orange, UIColor.yellow, UIColor.red, UIColor.gray, UIColor.systemPink, UIColor.systemGreen, UIColor.blue, UIColor.cyan]
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .white
        return tv
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "InstagramLogo.png"), style: .plain, target: self, action: #selector(disMiss))
        navigationController?.navigationBar.tintColor = .red
    }
    
    @objc private func disMiss() {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerInSectionView: UIView = {
            let view = UIView()
            view.backgroundColor = .white
            return view
        }()
        let btnNewDm: UIButton = {
           let btn = UIButton()
            btn.setImage(UIImage(named: "InstagramLogo.png"), for: .normal)
            return btn
        }()
        let btn1: UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(named: "personUpdate.png"), for: .normal)
            return btn
        }()
        let btn2: UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(named: "multiUpdate.png"), for: .normal)
            return btn
        }()
        headerInSectionView.addSubview(btnNewDm)
        headerInSectionView.addSubview(btn1)
        headerInSectionView.addSubview(btn2)
        
        btnNewDm.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(50)
            make.left.equalTo(headerInSectionView.snp.left).offset(40)
        }
        btn1.snp.makeConstraints { (make) in
            make.width.height.equalTo(40)
            make.centerY.equalTo(headerInSectionView.snp.centerY)
            make.right.equalTo(headerInSectionView.snp.right).offset(-30)
        }
        btn2.snp.makeConstraints { (make) in
            make.width.height.equalTo(40)
            make.centerY.equalTo(headerInSectionView.snp.centerY)
            make.right.equalTo(btn1.snp.left).offset(-20)
        }
        btn2.addTarget(self, action: #selector(GoToDm), for: .touchUpInside)
        
        return headerInSectionView
    }
    
    @objc private func GoToDm() {
        let DmVC = GoToDmMessageViewController()
        navigationController?.pushViewController(DmVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func setupTable() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        
        tableView.snp.makeConstraints { (make) in
            make.width.height.top.equalToSuperview()
        }
        
        tableView.register(DmCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DmCell
        
        cell.backgroundColor = .lightGray
        cell.DmPicture.backgroundColor = DmPictureColor[indexPath.row]
        cell.DmLabel.text = DmMessageUser[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DmMessageUser.count
    }

}

class DmCell : UITableViewCell {
    let cellView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    let DmPicture : UIView = {
       let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 25
        return view
    }()
    let DmLabel : UILabel = {
        let label = UILabel()
        label.text = "Name 1"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    let DmContent : UILabel = {
        let label = UILabel()
        label.text = "blabalabla"
        label.textColor = .black
        return label
    }()
    let DmCamera : UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(named: "camera.png"), for: .normal)
        return btn
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    func setupView() {
        addSubview(cellView)
        cellView.addSubview(DmPicture)
        cellView.addSubview(DmLabel)
        cellView.addSubview(DmContent)
        cellView.addSubview(DmCamera)
        
        cellView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(80)
            make.top.equalToSuperview()
        }
        DmPicture.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.top.equalTo(cellView.snp.top).offset(10)
            make.left.equalTo(cellView.snp.left).offset(15)
        }
        DmLabel.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(30)
            make.top.equalTo(cellView.snp.top).offset(10)
            make.left.equalTo(DmPicture.snp.right).offset(10)
        }
        DmContent.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(30)
            make.top.equalTo(DmLabel.snp.bottom)
            make.left.equalTo(DmLabel.snp.left)
        }
        DmCamera.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
            make.centerY.equalTo(DmPicture.snp.centerY)
            make.right.equalTo(cellView.snp.right).offset(-15)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class GoToDmMessageViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = " 만드는 중이에요 ㅠㅠ"
    }
    
}

#if DEBUG

import SwiftUI
struct DmViewControllerRepresentable: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // leave this empty
    }
    @available( ios 14.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        DmViewController()
    }
}
    @ available( ios 14.0, *)
    struct DmViewControllerRepresentable_PreviewProvider: PreviewProvider {
        static var previews: some View {
            Group {
                DmViewControllerRepresentable()
                    .ignoresSafeArea()
                    .previewDisplayName("Praview")
                    .previewDevice(PreviewDevice(rawValue: "iphone 11"))
            }
        }
    } #endif
