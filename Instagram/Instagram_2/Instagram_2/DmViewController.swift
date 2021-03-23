//
//  File.swift
//  Instagram_2
//
//  Created by 최광호 on 2021/03/22.
//

import UIKit
import SnapKit

class DmViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let DmMessageUser = ["경희", "한양", "숭실", "서울", "고대", "연대","경희", "한양", "숭실", "서울", "고대", "연대"]
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .gray
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerInSectionView: UIView = {
            let view = UIView()
            view.backgroundColor = .cyan
            return view
        }()
        let btnNewDm: UIButton = {
           let btn = UIButton()
            btn.backgroundColor = .gray
            btn.snp.makeConstraints { (make) in
                make.width.equalTo(100)
                make.height.equalTo(50)
            }
            return btn
        }()
        
        headerInSectionView.addSubview(btnNewDm)
        
        return headerInSectionView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func setupTable() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.snp.makeConstraints { (make) in
            make.width.height.top.equalToSuperview()
        }
        
        tableView.register(DmCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DmCell
        
        cell.backgroundColor = .lightGray
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
        view.backgroundColor = .orange
        return view
    }()
    let DmPicture : UIView = {
       let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 30
        return view
    }()
    let DmLabel : UILabel = {
        let label = UILabel()
        label.text = "Name 1"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
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
            make.height.equalTo(70)
            make.top.equalToSuperview()
        }
        DmPicture.snp.makeConstraints { (make) in
            make.width.height.equalTo(60)
            make.top.equalTo(cellView.snp.top).offset(5)
            make.left.equalTo(cellView.snp.left).offset(15)
        }
        DmLabel.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(35)
            make.top.equalTo(cellView.snp.top).offset(5)
            make.left.equalTo(DmPicture.snp.right).offset(10)
        }
        DmContent.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(35)
            make.top.equalTo(DmLabel.snp.bottom)
            make.left.equalTo(DmLabel.snp.left)
        }
        DmCamera.snp.makeConstraints { (make) in
            make.width.height.equalTo(35)
            make.centerY.equalTo(cellView.snp.centerY)
            make.right.equalTo(cellView.snp.right).offset(-15)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
