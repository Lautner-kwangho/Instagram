//
//  FourthViewController.swift
//  Instagram_2
//
//  Created by 최광호 on 2021/03/28.
//

import UIKit
import SnapKit

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

