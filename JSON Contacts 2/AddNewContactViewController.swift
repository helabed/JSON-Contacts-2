//
//  AddNewContactViewController.swift
//  JSON Contacts 2
//
//  Created by Hani Elabed on 3/27/16.
//  Copyright © 2016 Hani Elabed. All rights reserved.
//

import UIKit

class AddNewContactViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cellPhoneTextField: UITextField!

    var contacts: MyContacts?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func doneButtonTapped(sender: UIBarButtonItem) {
        let first = firstNameTextField.text
        let last = lastNameTextField.text
        let email = emailTextField.text
        let phone = cellPhoneTextField.text

        contacts!.addNewContact(first!, lastName: last!, email: email!, cell: phone!)

        navigationController?.popViewControllerAnimated(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
