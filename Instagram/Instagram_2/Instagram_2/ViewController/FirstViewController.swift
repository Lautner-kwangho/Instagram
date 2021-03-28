//
//  FirstViewController.swift
//  Instagram_2
//
//  Created by 최광호 on 2021/03/28.
//

import UIKit
import SnapKit
class FirstViewController:UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let userName = ["eofjh_123", "hfdkl_.das", "ahsdk12jdl__", "iue9u2", "ndc._.ew", "ehq2312"]
    let userPictureName = ["만리장성.jpg","베이징.jpg","병마.jpg","중국 운남산.jpg","판다.jpg","shop.jpg"]
    
    let myProfile: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .cyan
        btn.imageEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    lazy var myCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
       let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
       layout.scrollDirection = .horizontal
       layout.minimumLineSpacing = 20
       view.delegate = self
       view.dataSource = self
       view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
       view.backgroundColor = .white
       view.snp.makeConstraints { (make) in
            make.height.equalTo(100)
            make.width.equalTo(430)
       }
       return view
    }()
        
    lazy var myTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelection = true
//        tableView.tableHeaderView = myCollectionView
        return tableView
    }()
    
    let HeaderTitleView: UIView = {
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
        btn.addTarget(self, action: #selector(SendMessage), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        setHeaderLayout()
        setupTableView()
    }
    
    func setupTableView() {
        self.view.addSubview(myTableView)
//        myTableView.addSubview(myCollectionView)
        
        myTableView.snp.makeConstraints { (make) in
            make.top.equalTo(HeaderTitleView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
//        myCollectionView.snp.makeConstraints { (make) in
//            make.top.equalToSuperview()
//        }
        myTableView.register(instagramContentCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userName.count
    }

    
    func setHeaderLayout(){
        self.view.addSubview(HeaderTitleView)
        HeaderTitleView.addSubview(btnInstagram)
        HeaderTitleView.addSubview(btnUploadStory)
        HeaderTitleView.addSubview(btnCheckFeed)
        HeaderTitleView.addSubview(btnSendMessage)
        HeaderTitleView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(50)
            $0.height.equalTo(50)
        }
        btnInstagram.snp.makeConstraints { (make) in
            make.width.equalTo(140)
            make.height.equalTo(40)
            make.centerY.equalTo(HeaderTitleView.snp.centerY)
            make.left.equalTo(HeaderTitleView.snp.left).offset(10)
        }
        btnUploadStory.snp.makeConstraints { (make) in
            make.width.equalTo(35)
            make.height.equalTo(35)
            make.centerY.equalTo(HeaderTitleView.snp.centerY).offset(-1)
            make.right.equalTo(btnCheckFeed.snp.left).offset(-20)
        }
        btnCheckFeed.snp.makeConstraints { (make) in
            make.width.equalTo(35)
            make.height.equalTo(35)
            make.centerY.equalTo(HeaderTitleView.snp.centerY)
            make.right.equalTo(btnSendMessage.snp.left).offset(-15)
        }
        btnSendMessage.snp.makeConstraints { (make) in
            make.width.equalTo(33)
            make.height.equalTo(33)
            make.centerY.equalTo(HeaderTitleView.snp.centerY).offset(-2)
            make.right.equalTo(HeaderTitleView.snp.right).offset(-20)
        }
    }
    
    
    @objc private func SendMessage() {
//        let vc = DmViewController()
//        vc.modalPresentationStyle = .automatic
//        present(vc, animated: true)
//
        let VC = DmViewController()
        let NavVC = UINavigationController(rootViewController: VC)
        NavVC.modalPresentationStyle = .fullScreen
        present(NavVC, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let StoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        let StoryName: UILabel = {
           let label = UILabel()
            label.text = "Name"
            return label
        }()
        
        StoryCell.contentView.backgroundColor = .gray
        StoryCell.contentView.layer.cornerRadius = 25
        StoryCell.contentView.addSubview(StoryName)

        StoryName.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(20)
            make.top.equalTo(StoryCell.snp.bottom)
            make.centerX.equalTo(StoryCell.snp.centerX).offset(4)
        }

        return StoryCell
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
}
