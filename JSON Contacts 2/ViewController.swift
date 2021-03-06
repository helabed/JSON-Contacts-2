//
//  ViewController.swift
//  JSON Contacts 2
//
//  Created by Hani Elabed on 3/23/16.
//  Copyright © 2016 Hani Elabed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contactsTextView: UITextView!

    var contacts = MyContacts()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        contacts.loadJSONContactsWithFileName("json-contacts")
        contacts.createJSONDictionary()
        contacts.sortByFirstNameThenLastName()
        contactsTextView.text = contacts.description
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        contacts.sortByFirstNameThenLastName()
        contactsTextView.text = contacts.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "showAddContact" {
            let addController = segue.destinationViewController as! AddNewContactViewController
            addController.contacts = contacts
        }
    }
}

