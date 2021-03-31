//
//  FifthViewController.swift
//  Instagram_2
//
//  Created by 최광호 on 2021/03/28.
//

import UIKit
import SnapKit

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
        let header = CollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
        return header
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
}
