//
//  DetailViewController.swift
//  ContactList
//
//  Created by Carlos Poles on 12/04/2016.
//  Copyright © 2016 Carlos Poles. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var textFirstName: UITextField!
    
    @IBOutlet weak var textMiddleName: UITextField!
    
    @IBOutlet weak var textLastName: UITextField!
    
    @IBOutlet weak var textYearOfBirth: UITextField!
    
    @IBOutlet weak var textPhoneNumber: UITextField!
    
    @IBOutlet weak var textAddress: UITextField!
    
    
    
    
    

    

    func configureView() {
        // Update the user interface for the detail item.
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


}

