//
//  ComposerViewController.swift
//  Journal
//
//  Created by Duc Tran on 11/28/16.
//  Copyright © 2016 Developers Academy. All rights reserved.
//

// 1 - Model the object - x
// 2 - Create a new object - x
// 3 - Fetch objects - x
// 4 - Update edited object - x
// 5 - Delete objects

import UIKit
import CoreData

class ComposerViewController: UIViewController {
    
    var managedObjectContext: NSManagedObjectContext!
    var entry: Entry!
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var doneBarButtonItem: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = doneBarButtonItem
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext

        if entry != nil {
            title = "Edit entry"
            textView.text = entry.bodyText
        } else {
            title = "Compose a new entry"
            textView.text = ""
        }
    }
    
    @IBAction func doneDidTap()
    {
        if entry != nil {
            self.updateEntry()
        } else {
            if textView.text != "" {
                self.createNewEntry()
            }
        }
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func updateEntry()
    {
        entry.bodyText = self.textView.text
        entry.createdAt = Date() as NSDate
        
        do {
            try managedObjectContext.save()
        } catch let error as NSError {
            print("could not save the new netry \(error.localizedDescription)")
        }
    }
    
    func createNewEntry()
    {
        let entryEntity = NSEntityDescription.entity(forEntityName: "Entry", in: self.managedObjectContext)!
        let newEntry = Entry(entity: entryEntity, insertInto: managedObjectContext)
        
        newEntry.bodyText = self.textView.text
        newEntry.createdAt = Date() as NSDate
        
        do {
            try managedObjectContext.save()
        } catch let error as NSError {
            print("could not save the new netry \(error.localizedDescription)")
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
