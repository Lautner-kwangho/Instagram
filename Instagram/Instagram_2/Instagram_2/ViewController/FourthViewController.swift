//
//  FourthViewController.swift
//  Instagram_2
//
//  Created by 최광호 on 2021/03/28.
//

import UIKit
import SnapKit

class FourthViewController: UIViewController {
    
    lazy private var CollectionView: UICollectionView = {
        let CV = UICollectionView(frame: .zero, collectionViewLayout: FourthViewController.createLayout())
        CV.delegate = self
        CV.dataSource = self
        CV.frame = view.bounds
        CV.backgroundColor = .white
        CV.register(FourthCollectionViewCell.self, forCellWithReuseIdentifier: FourthCollectionViewCell.identifier)
        return CV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(CollectionView)
    }
    
}

extension FourthViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: FourthCollectionViewCell.identifier, for: indexPath) as! FourthCollectionViewCell
        return cell
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        //item
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.6),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let verticalStackItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        verticalStackItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let verticalStackGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.4),
                heightDimension: .fractionalHeight(1)),
                subitem: verticalStackItem,
                count: 2
        )
        
        let tripleItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1))
        )
        tripleItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let tripleHorizontalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(0.3)),
            subitem: tripleItem,
            count: 3
        )
        //group
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(0.7)),
            subitems: [
                item,
                verticalStackGroup
            ]
        )
        
        let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(0.8)),
            subitems: [
                horizontalGroup,
                tripleHorizontalGroup
            ])
    //secctions
        let section = NSCollectionLayoutSection(group: verticalGroup)
        //return
        return UICollectionViewCompositionalLayout(section: section)
    }
}
