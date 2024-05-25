//
//  SearchCollectionReusableView.swift
//  InstagramApp
//
//  Created by Arpit iOS Dev. on 17/05/24.
//

import UIKit

class SearchCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var searchbar: UISearchBar!
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if (kind == UICollectionView.elementKindSectionHeader) {
            let headerView:UICollectionReusableView =  collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchCollectionReusableView", for: indexPath)

                return headerView
            }

            return UICollectionReusableView()

       }
}
