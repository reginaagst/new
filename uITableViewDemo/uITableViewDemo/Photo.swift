//
//  Photo.swift
//  uITableViewDemo
//
//  Created by Reginald Augustin on 2/11/18.
//  Copyright © 2018 Reginald Augustin. All rights reserved.
//

import Foundation

struct Photo {
    var name:String = ""
    var photographerImageName:String = "<#value#>"
    var caption:String = ""
    var thumbnailImageName:String = ""
    
    static func downloadAllPhotos() -> [Photo]
    
    {
        
        var photos = [Photo]()
        
        for i in 1...10 {
            
            let photo = Photo(name: "\(i)", photographerImageName: "p\(i)", caption: "Lorem ipsum dolor  amet, consectetur adipiscing elit. Morbi bibendum lobortis facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus auctor, tortor vitae pretium euismod, arcu augue sodales nisi, vel volutpat lacus odio id ante. Sed gravida massa eget augue fringilla tincidunt. Vestibulum ornare commodo elit", thumbnailImageName: "t\(i)" )
            photos.append(photo)
        }
        
        return photos
        
    }
}
