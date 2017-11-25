//
//  Person.swift
//  ContactList
//
//  Created by Carlos Poles on 12/04/2016.
//  Copyright © 2016 Carlos Poles. All rights reserved.
//

import Foundation

// MARK: Constants - setting dates

let todaysDate = Date()
let calendar = Calendar.current
let currentYear = (calendar as NSCalendar).component(.year, from: todaysDate)


// MARK: - Person class

class Person {
    
    // MARK: - Properties
    
    var firstName: String
    var middleName: String?
    var lastName: String
    var yearOfBirth: Int?
    var personFullName: String?
    
    var age: Int! {
        
        get{ if let birthdayYear = yearOfBirth {
            
            return currentYear - birthdayYear
            
        } else {
            
            return yearOfBirth
            }
        }
        
        
        set { yearOfBirth = currentYear - newValue }
        
    }
    
    // MARK: - Initialization
    
    init(firstName: String, middleName: String? = nil, lastName: String, yearOfBirth: Int? = nil )
    {
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.yearOfBirth = yearOfBirth
    }
    
    convenience init (firstName: String, lastName: String, age: Int, middleName: String? = nil)
    {
        self.init(firstName: firstName,lastName: lastName)
        self.middleName = middleName
        self.age = age
        
    }
    
    // MARK: - Functions
    
    func fullName() -> String {
        
        if (middleName == nil || middleName == "")
        {
            personFullName = "\(firstName) \(lastName)"
            
            
        } else {
            
            personFullName = "\(firstName) \(middleName!) \(lastName)"
        }
        
        return personFullName!
    }
    
    
} //end of Person class
