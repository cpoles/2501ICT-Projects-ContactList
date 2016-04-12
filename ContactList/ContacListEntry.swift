//
//  ContacListEntry.swift
//  ContactList
//
//  Created by Carlos Poles on 12/04/2016.
//  Copyright © 2016 Carlos Poles. All rights reserved.
//

import Foundation

class ContactListEntry : Person {
    
    // MARK: - Properties
    
    var address: String?
    var phoneNumber: String?
    
    // MARK: - Initialization
    
    init(firstName: String, lastName: String, yearOfBirth: Int? = nil, middleName: String? = nil, address: String? = nil, phoneNumber: String? = nil) {
        super.init(firstName: firstName, middleName: middleName, lastName: lastName, yearOfBirth: yearOfBirth)
        self.address = address
        self.phoneNumber = phoneNumber
    }
    
} // end of ContactListEntry class