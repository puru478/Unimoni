//
//  SaveCollectionCellVM.swift
//  UnimoniTest
//
//  Created by Purushottam Chandra on 18/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

class SaveCollectionCellVM {
    var imageString: String
    
    init() {
        imageString = "save_badge"
    }
}

extension SaveCollectionCellVM: CollectionCellRepresentable {
    static func registerCell(collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: "SaveCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SaveCollectionViewCell")
    }
    
    func cellInstantiate(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SaveCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SaveCollectionViewCell", for: indexPath) as! SaveCollectionViewCell
        cell.prepare(vm: self)
        return cell
    }
}
