//
//  PublishersCollectionViewController.swift
//  NewsReader
//
//  Created by Duc Tran on 9/1/16.
//  Copyright © 2016 Developers Academy. All rights reserved.
//

import UIKit

class PublishersCollectionViewController: UICollectionViewController
{
    var store = PublishersStore()
    
    struct Storyboard {
        static let publisherCell = "PublisherCell"
        static let sectionHeader = "SectionHeader"
        
        static let leftAndRightPaddings:CGFloat = 32.0 //  🔳🔳🔳
        static let numberOfItemsPerRow:CGFloat = 3.0
        static let titleHeghtAdjustment:CGFloat = 30.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionViewWidth = collectionView?.frame.width
        let itemWidth = (collectionViewWidth! - Storyboard.leftAndRightPaddings) / Storyboard.numberOfItemsPerRow
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth + Storyboard.titleHeghtAdjustment)
        
    }
    
    // MARK: - UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return store.numberOfSections
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return store.numberOfPublishers(inSection: section)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.publisherCell, for: indexPath) as! PublisherCollectionViewCell
        let publisher = store.publisherForItem(atIndexpath: indexPath)

        
        cell.publisher = publisher
        
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        let headerView =  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Storyboard.sectionHeader, for: indexPath) as! SectionHeaderCollectionReusableView
        
        if let publisher = store.publisherForItem(atIndexpath: indexPath)
        {
        headerView.publisher = publisher
        }
        return headerView
        }
}

















