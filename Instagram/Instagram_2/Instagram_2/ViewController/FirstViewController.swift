//
//  FirstViewController.swift
//  Instagram_2
//
//  Created by 최광호 on 2021/03/28.
//

import UIKit
import SnapKit
class FirstViewController:UIViewController {
    
    let userName = ["eofjh_123", "hfdkl_.das", "ahsdk12jdl__", "iue9u2", "ndc._.ew", "ehq2312"]
    let userPictureName = ["만리장성.jpg","베이징.jpg","병마.jpg","중국 운남산.jpg","판다.jpg","shop.jpg"]
    
    let myProfile: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .cyan
        btn.imageEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    lazy var myTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelection = true

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
        
        myTableView.snp.makeConstraints { (make) in
            make.top.equalTo(HeaderTitleView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        myTableView.register(instagramContentCell.self, forCellReuseIdentifier: "Cell")
        myTableView.register(InstagramStoryCell.self, forCellReuseIdentifier: "instagramStoryCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userName.count + 1
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
}

extension FirstViewController:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let StoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.identifier, for: indexPath) as! FirstCollectionViewCell
        /*
        let StoryName: UILabel = {
           let label = UILabel()
            label.text = "Name"
            return label
        }()
        
        StoryCell.contentView.backgroundColor = .gray
        StoryCell.contentView.layer.cornerRadius = 25
        StoryCell.contentView.addSubview(StoryName)

        StoryName.snp.makeConstraints { (make) in
            make.width.equalTo(60)//.equalToSuperview()
            make.height.equalTo(20)
            make.top.equalTo(StoryCell.snp.bottom)
            make.bottom.equalToSuperview()
            make.centerX.equalTo(StoryCell.snp.centerX).offset(4)
        }
         */
        return StoryCell
    }
    
}

extension FirstViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "instagramStoryCell") as! InstagramStoryCell
            cell.myCollectionView.delegate = self
            cell.myCollectionView.dataSource = self
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! instagramContentCell
        
        cell.backgroundColor = .white
        cell.NameCell.text = userName[indexPath.row - 1]
        cell.pictureCell.image = UIImage(named: userPictureName[indexPath.row - 1])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 100
        }
        return 700
//        UITableViewAutomatic 알아보기 self sizing
    }
}
