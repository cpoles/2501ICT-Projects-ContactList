//
//  DetailViewController.swift
//  ContactList
//
//  Created by Carlos Poles on 12/04/2016.
//  Copyright © 2016 Carlos Poles. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate {
    func displayObjectHasChanged()
}

class DetailViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var textFirstName: UITextField!
    
    @IBOutlet weak var textMiddleName: UITextField!
    
    @IBOutlet weak var textLastName: UITextField!
    
    @IBOutlet weak var textYearOfBirth: UITextField!
    
    @IBOutlet weak var textPhoneNumber: UITextField!
    
    @IBOutlet weak var textAddress: UITextField!
    
    var delegate : DetailViewControllerDelegate?
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        
        textFirstName.resignFirstResponder()
        textPhoneNumber.resignFirstResponder()
        textMiddleName.resignFirstResponder()
        textLastName.resignFirstResponder()
        textAddress.resignFirstResponder()
        textYearOfBirth.resignFirstResponder()
        return true
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let contact = self.detailItem as? ContactListEntry { // if the item is a ContactListEntryt
            if let firstName = self.textFirstName, let middleName = self.textMiddleName,
            let lastName = self.textLastName, let yearOfBirth = self.textYearOfBirth ,let phoneNumber = self.textPhoneNumber, let address = self.textAddress
            {
                delegate?.displayObjectHasChanged() // refreshes the table view when back to the master view
                firstName.text = contact.firstName
                middleName.text = contact.middleName
                lastName.text = contact.lastName
                phoneNumber.text = contact.phoneNumber
                yearOfBirth.text = "\(contact.yearOfBirth!)"
                address.text = contact.address
            }
        }
    }
    
    // MARK: Navigation
    
    


}

