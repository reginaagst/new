//
//  ComposerViewController.swift
//  Journal
//
//  Created by Reginald Augustin on 5/7/18.
//  Copyright © 2018 Reginald Augustin. All rights reserved.
//1- Model the object
//2- create a new object
//3- fetch Objects
//4- update edited object
//5- delete objects

import UIKit
import CoreData

class ComposerViewController: UIViewController {
    var managedObjectContext:NSManagedObjectContext!
    var entry:Entry!
    @IBOutlet weak var textView:UITextView!

    @IBOutlet weak var doneBarButtonItem: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = doneBarButtonItem
       let appDelegate =  UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        
        if entry != nil
        {   title = "Edit entry"
            textView.text = entry.bodyText
            title = "Compose a new entry"
        }else{
            textView.text = ""
            
        }

        // Do any additional setup after loading the view.
    }
    @IBAction func doneDidTap()
    {
        if entry != nil {
            self.updateEntry()
        }else{
            if textView.text != ""
            {
                self.createNewEntry()
            }
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func updateEntry()
    {
        entry.bodyText = self.textView.text
        entry.createdAt = Date() // as NSDate
        do
        {
            
            try managedObjectContext.save()
        }catch let error as NSError {
            print("could not save the new entry \(error.localizedDescription)")
        }
        
    }
    
    func createNewEntry() {
        let entryEntity = NSEntityDescription.entity(forEntityName: "Entry", in: managedObjectContext)!
        let newEntry = Entry(entity: entryEntity, insertInto: managedObjectContext)
        newEntry.bodyText = self.textView.text
        newEntry.createdAt = Date()
        
        do
        {
            
            try managedObjectContext.save()
        }catch let error as NSError {
            print("could not save the new entry \(error.localizedDescription)")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
