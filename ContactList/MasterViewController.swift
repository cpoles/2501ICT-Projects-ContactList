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
        self.navigationItem.leftBarButtonItem = self.editButtonItem

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                let controller = segue.destination as! DetailViewController
                controller.detailItem = object
                controller.delegate = self // the master view controller is the delegate
                print("showing detail...")
            }
        } else if segue.identifier == "addContact" {
                let contact = ContactListEntry(firstName: "", lastName: "")
                objects.append(contact)
                let controller = segue.destination as! DetailViewController
                controller.detailItem = contact 
                controller.delegate = self // the master view controller is the delegate
            print("Adding new contact")
            }
        
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    // Set the text values of the subviews on the Prototype Cell
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactDetailCell", for: indexPath) as! MasterTableViewCell
        let object = objects[indexPath.row] as! ContactListEntry
        cell.labelFullName.text = object.fullName()
        cell.labelPhoneNumber.text = object.phoneNumber
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    //MARK: - UIDetailViewControllerDelegate

    
    func destinationviewControllerContentChanged(_ destinationViewController: DetailViewController) {
        if let contact = destinationViewController.detailItem {
            print("Got \(contact)")
            dismiss(animated: true, completion: nil)
        }
        tableView.reloadData()
        
    }
    
} // end of MasterViewController Class

    




