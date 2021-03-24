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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(Login)
        Login.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
            items[x].badgeValue = "1"
            items[x].image = UIImage(systemName: images[x])
        }
        
        present(TabBar, animated: true)
    }
}

class instagramContentCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let NameCell: UILabel = {
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
//        Image.contentMode = .scaleAspectFit
        return Image
    }()
    let btnCell: UIView = {
        var btn = UIView()
        btn.backgroundColor = .white
        return btn
    }()
    let commentCell: UIView = {
        var btn = UIView()
        btn.backgroundColor = .white
        return btn
    }()
    let timeCell: UILabel = {
        let view = UILabel()
        view.backgroundColor = .white
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        superCellView()
    }
    
    func superCellView() {
        addSubview(cellView)
        cellView.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
            make.top.equalToSuperview().offset(80)
        }
        cellView.addSubview(NameCell)
        NameCell.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(cellView.snp.top)
            make.left.equalTo(cellView.snp.left).offset(10)
        }
        cellView.addSubview(pictureCell)
        pictureCell.snp.makeConstraints { (make) in
            make.top.equalTo(NameCell.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(450)
        }
        cellView.addSubview(btnCell)
        btnCellContent()
        btnCell.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(pictureCell.snp.bottom)
        }
        cellView.addSubview(commentCell)
        commentCellContent()
        commentCell.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(130)
            make.top.equalTo(btnCell.snp.bottom)
        }
        cellView.addSubview(timeCell)
        timeCellText()
        timeCell.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(20)
            make.top.equalTo(commentCell.snp.bottom)
        }
        
    }
    
    func btnCellContent() {
        let btnheart: UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(named: "heart.png"), for: .normal)
            return btn
        }()
        let btnComment: UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(named: "comment.png"), for: .normal)
            return btn
        }()
        let btnMessage: UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(named: "Message.png"), for: .normal)
            return btn
        }()
        let btnSave: UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(named: "save.png"), for: .normal)
            return btn
        }()
        btnCell.addSubview(btnheart)
        btnheart.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.centerY.equalTo(btnCell.snp.centerY)
            make.left.equalTo(btnCell.snp.left).offset(10)
        }
        btnCell.addSubview(btnComment)
        btnComment.snp.makeConstraints { (make) in
            make.height.equalTo(25)
            make.width.equalTo(25)
            make.centerY.equalTo(btnCell.snp.centerY)
            make.left.equalTo(btnheart.snp.right).offset(15)
        }
        btnCell.addSubview(btnMessage)
        btnMessage.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.centerY.equalTo(btnCell.snp.centerY)
            make.left.equalTo(btnComment.snp.right).offset(15)
        }
        btnCell.addSubview(btnSave)
        btnSave.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.centerY.equalTo(btnCell.snp.centerY)
            make.right.equalTo(btnCell.snp.right).offset(-10)
        }
    }
    
    func commentCellContent() {
        let likeCount: UILabel = {
            let label = UILabel()
            label.text = "  좋아요 5개"
            return label
        }()
        let name: UILabel = {
            let view = UILabel()
            view.text = "anonymous"
            return view
        }()
        let moreComment: UIButton = {
            let btn = UIButton()
            btn.setTitle("댓글 더 보기", for: UIControl.State.normal)
            return btn
        }()
        let inputComment: UIView = {
            let view = UIView()
            return view
        }()
        
        commentCell.addSubview(likeCount)
        commentCell.addSubview(name)
        commentCell.addSubview(moreComment)
        commentCell.addSubview(inputComment)
        
        likeCount.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.width.equalToSuperview()
            make.left.equalTo(commentCell.snp.left).offset(10)
        }
        name.snp.makeConstraints { (make) in
            make.height.equalTo(60)
            make.width.equalToSuperview()
            make.top.equalTo(likeCount.snp.bottom)
            make.left.equalTo(commentCell.snp.left).offset(10)
        }
        moreComment.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.width.equalToSuperview()
            make.top.equalTo(name.snp.bottom)
            make.left.equalTo(commentCell.snp.left).offset(10)
        }
        inputComment.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.width.equalToSuperview()
            make.top.equalTo(moreComment.snp.bottom)
            make.left.equalTo(commentCell.snp.left).offset(10)
        }
        let myComment: UITextField = {
            let comment = UITextField()
            comment.text = "input"
            return comment
            }()
        
            inputComment.addSubview(myComment)
        
            myComment.snp.makeConstraints { (make) in
                make.height.equalToSuperview()
                make.width.equalToSuperview()
                make.top.equalTo(inputComment.snp.top)
                }
            }
    
    func timeCellText() {
        timeCell.text = " 15분 전 "
        timeCell.snp.makeConstraints { (make) in
            make.rightMargin.equalToSuperview().offset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        setupTableView()
    }
    
    func setupTableView() {
        self.view.addSubview(myTableView)
        myTableView.addSubview(myCollectionView)
        
        myTableView.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
            make.top.equalToSuperview().offset(50)
        }
        myCollectionView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(50)
        }
        myTableView.register(instagramContentCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userName.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
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
        
        HeaderTitleView.addSubview(btnInstagram)
        HeaderTitleView.addSubview(btnUploadStory)
        HeaderTitleView.addSubview(btnCheckFeed)
        HeaderTitleView.addSubview(btnSendMessage)

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
    return HeaderTitleView
    }
    
    @objc private func SendMessage() {
        let vc = DmViewController()
        vc.modalPresentationStyle = .automatic
        present(vc, animated: true)
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

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
    }
}
class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }
}
class FourthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
}
class FifthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}


#if DEBUG

import SwiftUI
struct FirstViewControllerRepresentable: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // leave this empty
    }
    @available( ios 14.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        FirstViewController()
        return FirstViewController()
    }
}
    @ available( ios 14.0, *)
    struct FirstViewControllerRepresentable_PreviewProvider: PreviewProvider {
        static var previews: some View {
            Group {
                FirstViewControllerRepresentable()
                    .ignoresSafeArea()
                    .previewDisplayName("Praview")
                    .previewDevice(PreviewDevice(rawValue: "iphone 11"))
            }
        }
    }
#endif

