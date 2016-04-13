//
//  DetailViewController.swift
//  ContactList
//
//  Created by Carlos Poles on 12/04/2016.
//  Copyright © 2016 Carlos Poles. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate {
    func destinationviewControllerContentChanged(destinationViewController: DetailViewController)
}

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    
    // MARK: Properties
    
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
            print("detailItem was set")
        }
    }
    
    var contact: ContactListEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Make this DetailViewController the delegate for the text fields.
        
        textFirstName.delegate = self
        textMiddleName.delegate = self
        textLastName.delegate = self
        textYearOfBirth.delegate = self
        textPhoneNumber.delegate = self
        textAddress.delegate = self
        
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
        textMiddleName.resignFirstResponder()
        textLastName.resignFirstResponder()
        textAddress.resignFirstResponder()
        textYearOfBirth.resignFirstResponder()
        textPhoneNumber.resignFirstResponder()
        return true
    }

    func configureView() {
        // Update the user interface for the detail item
            contact = (self.detailItem as! ContactListEntry)
        
            if let firstName = self.textFirstName, let middleName = self.textMiddleName,
            let lastName = self.textLastName, let yearOfBirth = self.textYearOfBirth ,let phoneNumber = self.textPhoneNumber, let address = self.textAddress
            {
                firstName.text = contact!.firstName
                middleName.text = contact!.middleName
                lastName.text = contact!.lastName
                phoneNumber.text = contact!.phoneNumber
                if let yOB = contact!.yearOfBirth {
                    yearOfBirth.text = "\(yOB)"
                } else {
                    yearOfBirth.text = nil
                }
                address.text = contact!.address
            }
}
    
    override func viewWillDisappear(animated: Bool) {
        contact!.middleName = textMiddleName.text!
        contact!.lastName = textLastName.text!
        contact!.phoneNumber = textPhoneNumber.text!
        contact!.firstName = textFirstName.text!
        contact!.yearOfBirth = Int(textYearOfBirth.text!)
        contact!.address = textAddress.text!
        delegate?.destinationviewControllerContentChanged(self)
        print("leaving...")
    }
    
    override func viewDidDisappear(animated: Bool) {
        
        print("bye")
        
    }
}

