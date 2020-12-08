//
//  CuratedCollectionViewInCellTableViewCell.swift
//  Romato
//
//  Created by Navati Jain on 2020-12-06.
//

import UIKit

class CuratedCollectionViewInCellTableViewCell: UITableViewCell {
    fileprivate struct Constants {
        static let cellReuseID = "CuratedCollectionCell"
    }
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.scrollDirection = .horizontal
        //flowLayout.itemSize = CGSize(width: contentView.frame.size.width, height: 1000)
       // flowLayout.estimatedItemSize = CGSize(width: contentView.frame.size.width, height: 250)
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .red
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: Constants.cellReuseID)
        return collectionView
    }()
    
    private func setupUI(){
        contentView.addSubviewsWithAutoLayout(collectionView)
        var constraints = collectionView.anchor(to: contentView)
        constraints.append(contentsOf: [collectionView.widthAnchor.constraint(equalToConstant: collectionView.bounds.size.width)])
        NSLayoutConstraint.activate(constraints)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CuratedCollectionViewInCellTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellReuseID, for: indexPath) as? CollectionCell {
            return cell
        }  else {
            return UICollectionViewCell()
        }
    }
    
   // func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        //TODO: Clarify
//        return CGSize(width: collectionView.bounds.size.width - 30, height: 200)
//    }
    
    //
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
//    
//    override func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize {
//        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
//    }
    
}
