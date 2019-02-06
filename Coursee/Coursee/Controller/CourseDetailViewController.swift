//
//  CourseDetailViewController.swift
//  Coursee
//
//  Created by Reginald Augustin on 1/9/18.
//  Copyright © 2018 Reginald Augustin. All rights reserved.
//

import UIKit

class CourseDetailViewController: UIViewController {
    
    @IBOutlet weak var joinCourseButton:UIButton!
    
    @IBOutlet weak var courseTitleLabel: UILabel!
    
    @IBOutlet weak var courseDescriptionTextView: UITextView!
    @IBOutlet weak var courseFeaturedImageView: UIImageView!
    
    var course:Course!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        courseFeaturedImageView.image = course.featuredImage
        courseTitleLabel.text = course.title
        courseDescriptionTextView.text = course.description
        joinCourseButton.setTitle("join \(course.instructor)", for: [])
       self.navigationItem.title = course.instructor
        
        joinCourseButton.layer.cornerRadius = 3.0
joinCourseButton.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }

    @IBAction func playButtonDidTap(_ sender: Any)
    {
        
        
    }
    
    @IBAction func joinButtonDidTap(_ sender: Any)
        
    {
    
        let alertController = UIAlertController(title: "Congratulations!", message: "You just enrolled in \(course.title) successfully!", preferredStyle:  UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action) in
            self.dismiss(animated: true, completion: nil)
            
            
        }
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
   
}
