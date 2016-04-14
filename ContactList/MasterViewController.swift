//
//  MasterViewController.swift
//  ContactList
//
//  Created by Carlos Poles on 12/04/2016.
//  Copyright © 2016 Carlos Poles. All rights reserved.
//

import UIKit


class MasterViewController: UITableViewController, DetailViewControllerDelegate {
    
    // MARK: Properties
    
    var detailViewController: DetailViewController?
    var objects: [AnyObject] = [ContactListEntry]()
    let button = UIBarButtonItem()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

    }
    
    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func insertNewObject(sender: AnyObject) {
        objects.insert(ContactListEntry(firstName: "New", lastName: "Contact"), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                let controller = segue.destinationViewController as! DetailViewController
                controller.detailItem = object
                controller.delegate = self // the master view controller is the delegate
            }
        } else if segue.identifier == "addContact" {
            let contact = ContactListEntry(firstName: "", lastName: "")
            objects.append(contact)
            print("object created.")
            let controller = segue.destinationViewController as! DetailViewController
            controller.detailItem = contact
            controller.delegate = self // the master view controller is the delegate
            
            print("Adding new contact")
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    // Function that sets the values on the Prototype Cell
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ContactDetailCell", forIndexPath: indexPath) as! MasterTableViewCell
        let object = objects[indexPath.row] as! ContactListEntry
        cell.labelFullName.text = object.fullName()
        cell.labelPhoneNumber.text = object.phoneNumber
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    //MARK: - UIDetailViewControllerDelegate

    
    func destinationviewControllerContentChanged(destinationViewController: DetailViewController) {
        if let contact = destinationViewController.detailItem {
            print("Got \(contact)")
            dismissViewControllerAnimated(true, completion: nil)
        }
        tableView.reloadData()
    }
    
} // end of MasterViewController Class

    




