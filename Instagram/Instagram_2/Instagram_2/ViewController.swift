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
            make.width.equalToSuperview()
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
class FourthViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy private var CollectionView: UICollectionView = {
        let CV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        CV.delegate = self
        CV.dataSource = self
        CV.frame = view.bounds
        CV.register(secondCollectionViewCell.self, forCellWithReuseIdentifier: secondCollectionViewCell.identifier)
        return CV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(CollectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: secondCollectionViewCell.identifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/3, height: view.frame.size.width/3)
    }
}

class secondCollectionViewCell: UICollectionViewCell {
    static let identifier = "secondCollectionViewCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class FifthViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var CollectionView: UICollectionView = {
        let CV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        CV.backgroundColor = .white
        CV.delegate = self
        CV.dataSource = self
        CV.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        return CV
    }()
    let lblTest : UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .lightGray
        return lbl
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    private func setupCollectionView() {
        view.addSubview(lblTest)
        lblTest.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(100)
            make.top.equalTo(view.snp.top)
        }
        view.addSubview(CollectionView)
        CollectionView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.equalTo(lblTest.snp.bottom)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        CollectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        CollectionView.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier)
    }
    // CollectionView 반복
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    // CollectionView cell 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath)
        return cell
    }
    // CollectionViewHaeder, Footer
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            guard let header = CollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as? HeaderCollectionReusableView else {
                return UICollectionReusableView()
            }
//            header.configure(with: true)
            return header
        }
        //Footer
            return CollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.identifier, for: indexPath)
    }
    // CollectionView 공백
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    // CollectionView 중간 열 개수
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    // CollectionView 중간 내용 safeMargins
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
    // CollectionView 중간 cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/3-4, height: view.frame.size.width/3-4)
    }
    //CollectionView header 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        //  반복되는 CollectionView 1 Section 크기 없애서 다음 셀 안나오게 하기
//        if section == 1 {
//            return .zero
//        }
        return CGSize(width: view.frame.size.width, height: view.frame.size.height / 2)
    }
    //CollectionView footer 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: view.frame.size.width)
    }
}

class TestViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3
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

