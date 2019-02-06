//
//  PhotoTableViewCell.swift
//  uITableViewDemo
//
//  Created by Reginald Augustin on 2/12/18.
//  Copyright © 2018 Reginald Augustin. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

   
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    var photo:Photo!{
        didSet{
            
           self.updateUI()
            
        }
    }
    private func updateUI(){
        
        photoImageView.image = UIImage(named:photo.name)
        profileImageView.image = UIImage(named:photo.photographerImageName)
        captionLabel.text = photo.caption
        
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2.0
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.borderWidth = 0.5
        profileImageView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.6).cgColor
        profileImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        profileImageView.layer.opacity = 1
        profileImageView.layer.shadowRadius = 6
        
        
        captionLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        captionLabel.layer.opacity = 5
        captionLabel.layer.shadowRadius = 6
    }
}
