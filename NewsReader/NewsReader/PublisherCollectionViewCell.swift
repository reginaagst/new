//
//  PublisherCollectionViewCell.swift
//  NewsReader
//
//  Created by Reginald Augustin on 5/5/18.
//  Copyright © 2018 Reginald Augustin. All rights reserved.
//

import UIKit

class PublisherCollectionViewCell: UICollectionViewCell
{
    
    @IBOutlet weak var publisherImageView: UIImageView!
    @IBOutlet weak var publisherTitleLabel: UILabel!
    
    var publisher:Publisher!
    {
        didSet{
            
            self.publisherImageView.image = publisher.image
            publisherTitleLabel.text = publisher.title
            
            self.layer.cornerRadius = 3.0
            self.layer.masksToBounds = true
            
        }
        
    }
}


