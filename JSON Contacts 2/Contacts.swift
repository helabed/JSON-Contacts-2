//
//  Contacts.swift
//  JSON Contacts 1
//
//  Created by Hani Elabed on 3/20/16.
//  Copyright © 2016 Hani Elabed. All rights reserved.
//

import Foundation

class Contact: CustomStringConvertible {

    var firstName: String
    var lastName: String
    var email: String
    var cell: String

    init(firstName: String, lastName: String, email: String, cell: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.cell = cell
    }

    convenience init(contactDictionary: NSDictionary) {
        self.init(
            firstName: (contactDictionary["firstName"] ?? "") as! String,
            lastName: (contactDictionary["lastName"] ?? "") as! String,
            email: (contactDictionary["email"] ?? "") as! String,
            cell: (contactDictionary["cell"] ?? "") as! String
        )
    }

    var description: String {
        return "\(firstName) \(lastName), \(email), \(cell)\n"
    }
}


class MyContacts: CustomStringConvertible {
    var jsonData: NSData
    var jsonArray: NSArray
    var contactsArray: [Contact]

    var description: String {
        var descriptionBuffer : String = ""

        for contact in contactsArray {
            descriptionBuffer.appendContentsOf(contact.description)
        }

        return descriptionBuffer
    }

    init() {
        jsonData = NSData()
        jsonArray = []
        contactsArray = []
    }

    func loadJSONContactsWithFileName(fileName: String) {

        let jsonURL = NSBundle.mainBundle().URLForResource(fileName, withExtension: "js")

        if let urlCheck = jsonURL {
            jsonData = NSData(contentsOfURL: urlCheck)!
        }
        do {
            jsonArray = try NSJSONSerialization.JSONObjectWithData(jsonData,
                options: NSJSONReadingOptions.MutableContainers) as! NSArray
        } catch {
            jsonArray = []
        }


        // in class teacher added try!
//        let jsonArray2 : NSArray = try! NSJSONSerialization.JSONObjectWithData(jsonData,
//            options: NSJSONReadingOptions.MutableContainers) as! NSArray



    }

    func createJSONDictionary() {
        for json in jsonArray {
            let dictionary = json as! NSDictionary
            let contact = Contact(contactDictionary: dictionary)
            contactsArray.append(contact)
        }
    }
}