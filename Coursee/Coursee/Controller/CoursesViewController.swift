//
//  CoursesViewController.swift
//  Coursee
//
//  Created by Reginald Augustin on 1/7/18.
//  Copyright © 2018 Reginald Augustin. All rights reserved.
//

import UIKit

class CoursesViewController: UIViewController

{
    @IBOutlet weak var chefCourseButton: UIButton!
    
    @IBOutlet weak var popStarCourseButton: UIButton!
   
    @IBOutlet weak var developerCourseButton: UIButton!
    
    var courses:[Course] = CourseStore.downloadNewCourses()
    var selectedCourse:Course!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateUI()
        
        
        }
    func updateUI() {
        
        let chefCourse = courses[0]
        chefCourseButton.setImage(chefCourse.buttonImage, for: [])
        let popStarCourse = courses[1]
        popStarCourseButton.setImage(popStarCourse.buttonImage, for: [])
        let developerCourse = courses[0]
        developerCourseButton.setImage(developerCourse.buttonImage, for: [])
        
        // Do any additional setup after loading the view.
    }

    @IBAction func chefCourseDidTap(_ sender: Any)
    
    {
        let chefCourse = self.courses[0]
        selectedCourse = chefCourse
        print(selectedCourse.title)
        
        self.performSegue(withIdentifier: Storyboard.showCourseDetail, sender: nil)
    }
    struct  Storyboard {
        static let showCourseDetail = "ShowCourseDetail"
    }
    

    @IBAction func popStarCourseDidTap(_ sender: Any)
    {
        let popStarCourse = self.courses[1]
        selectedCourse = popStarCourse
        print(selectedCourse.title)
        self.performSegue(withIdentifier: Storyboard.showCourseDetail, sender: nil)

    }
    
    @IBAction func developerCourseDidTap(_ sender: Any)
    {
        let developerCourse = self.courses[2]
        selectedCourse = developerCourse
        print(selectedCourse.title)
        self.performSegue(withIdentifier: Storyboard.showCourseDetail, sender: nil)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showCourseDetail{
            
            if  let courseDetailViewController = segue.destination as? CourseDetailViewController {
                
                courseDetailViewController.course = self.selectedCourse
                
            }
            
        }
    }
    
}
