//
//  PlayerViewController.swift
//  Coursee
//
//  Created by Reginald Augustin on 1/19/18.
//  Copyright © 2018 Reginald Augustin. All rights reserved.
//

import UIKit


class PlayerViewController: UIViewController
{
@IBOutlet weak var youtubePlayerView: YouTubePlayerView!

    var videoURL: URL!  =  URL(string:"https://www.youtube.com/watch?v=wyK7YuwUWsU")!

    override func viewWillAppear(_ animated: Bool) {
        if videoURL != nil {
            youtubePlayerView.loadVideoURL(videoURL)
        } else {
            let alertController = UIAlertController(title: "oop's", message: "you have an error", preferredStyle:  UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action) in
                self.dismiss(animated: true, completion: nil)
                
                
            }
            
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
    }
//override func viewDidLoad() {
 //   super.viewDidLoad()
    
        
        youtubePlayerView.layer.cornerRadius = 3.0
        youtubePlayerView.layer.masksToBounds = true
        
    }
    
    @IBAction func closeButtonDidTap(_ sender: Any) {
        
        
        self.dismiss(animated: true, completion: nil)
    }
}

        
        


