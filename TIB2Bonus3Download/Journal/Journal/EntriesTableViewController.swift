//
//  EntriesTableViewController.swift
//  Journal
//
//  Created by Duc Tran on 11/28/16.
//  Copyright © 2016 Developers Academy. All rights reserved.
//

import UIKit
import CoreData

class EntriesTableViewController: UITableViewController {
    
    var managedObjectContext: NSManagedObjectContext!
    var entries = [Entry]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        
        title = "Journal"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.fetchEntries()
    }
    
    func fetchEntries()
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Entry")
        
        do {
            let entryObjects = try managedObjectContext.fetch(fetchRequest)
            self.entries = entryObjects as! [Entry]
        } catch let error as NSError {
            print("could not fetch entries \(error.localizedDescription)")
        }
        
        self.tableView.reloadData()
    }
    
    @IBAction func composeDidTap()
    {
        self.performSegue(withIdentifier: "ShowEntryComposer", sender: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath)
        let entry = self.entries[indexPath.row]
        
        cell.textLabel?.text = entry.bodyText
        cell.detailTextLabel?.text = dateTimeFormattedAsTimeAgo(entry.createdAt as! Date)
        

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entry = entries[indexPath.row]
        self.performSegue(withIdentifier: "ShowEntryComposer", sender: entry)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowEntryComposer" {
            let composeVC = segue.destination as! ComposerViewController
            composeVC.entry = sender as? Entry
        }
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete {
            let entry = self.entries[indexPath.row]
            
            self.managedObjectContext.delete(entry)
            self.entries.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            do {
                try managedObjectContext.save()
            } catch let error as NSError {
                print("could not save the new netry \(error.localizedDescription)")
            }
        }
    }
}




















