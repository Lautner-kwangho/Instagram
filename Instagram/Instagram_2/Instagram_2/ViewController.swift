//
//  ViewController.swift
//  Instagram
//
//  Created by 최광호 on 2021/03/10.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let userName = ["경희", "연세", "한양", "서울", "경기", "수원"]
    
    let myTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorColor = .black
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
            make.edges.equalToSuperview()
        }
        myTableView.register(instagramContentCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userName.count
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
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
            btn.setImage(UIImage(named: "comment.png"), for: .normal)
            return btn
        }()
        
        let btnCheckFeed: UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(named: "upload.png"), for: .normal)
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
            make.width.equalTo(130)
            make.height.equalTo(40)
            make.centerY.equalTo(HeaderStoryVew.snp.centerY)
            make.left.equalTo(HeaderStoryVew.snp.left)
        }
        btnUploadStory.snp.makeConstraints { (make) in
            make.width.equalTo(35)
            make.height.equalTo(35)
            make.centerY.equalTo(HeaderStoryVew.snp.centerY).offset(-1)
            make.right.equalTo(btnCheckFeed.snp.left).offset(-20)
        }
        btnCheckFeed.snp.makeConstraints { (make) in
            make.width.equalTo(40)
            make.height.equalTo(40)
            make.centerY.equalTo(HeaderStoryVew.snp.centerY)
            make.right.equalTo(btnSendMessage.snp.left).offset(-15)
        }
        btnSendMessage.snp.makeConstraints { (make) in
            make.width.equalTo(35)
            make.height.equalTo(35)
            make.centerY.equalTo(HeaderStoryVew.snp.centerY).offset(-2)
            make.right.equalTo(HeaderStoryVew.snp.right).offset(-20)
        }
        return HeaderStoryVew
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! instagramContentCell
        cell.backgroundColor = .white
        cell.contentCell.text = userName[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 700
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        title = "home / uploading / story / profile / setting"
        return title
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
}

class instagramContentCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    let contentCell: UILabel = {
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
        Image.contentMode = .scaleAspectFit
        return Image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        superCellView()
    }
    
    func superCellView() {
        addSubview(cellView)
        cellView.addSubview(contentCell)
        
        cellView.snp.makeConstraints { (make) in
            make.size.equalToSuperview()
        }
        contentCell.snp.makeConstraints { (make) in
            make.size.equalTo(cellView.snp.size).dividedBy(0.5)
        }
        
        cellView.addSubview(pictureCell)
        pictureCell.snp.makeConstraints { (make) in
            make.size.equalTo(cellView.snp.size).dividedBy(0.5)
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

