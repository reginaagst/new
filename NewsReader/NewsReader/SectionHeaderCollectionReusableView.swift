//
//  SectionHeaderCollectionReusableView.swift
//  NewsReader
//
//  Created by Reginald Augustin on 5/5/18.
//  Copyright © 2018 Reginald Augustin. All rights reserved.
//

import UIKit

class SectionHeaderCollectionReusableView: UICollectionReusableView
{
    
    @IBOutlet weak var sectionTitleLabel: UILabel!
    
    var publisher:Publisher! {
        
        didSet{
            
            sectionTitleLabel.text = publisher.section.uppercased()
        }
        
    }
}
