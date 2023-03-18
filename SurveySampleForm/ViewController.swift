//
//  ViewController.swift
//  SurveySampleForm
//
//  Created by Maheen on 01/02/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
       
       override func viewDidLoad() {
           super.viewDidLoad()
       }

    @IBAction func submitButtonTapped(_ sender: Any) {
        if let name = nameTextField.text,
           let ageString = ageTextField.text,
           let age = Int(ageString),
           let email = emailTextField.text {
            
            if name.isEmpty {
                
                let alert = UIAlertController(title: "Error", message: "Name field is required.", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
                return
                
            }
            
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            if !emailPredicate.evaluate(with: email) {
                let alert = UIAlertController(title: "Error", message: "Email address is invalid.", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
                return
                
            }
            let alert = UIAlertController(title: "Congrats!", message: "Successfully submitted.", preferredStyle: .alert)

            let submitAction = UIAlertAction(title: "Okay", style: .default) { (_) in
                let surveyResult = [
                    "name": name,
                    "age": age,
                    "email": email
                ] as [String : Any]
                
                print(surveyResult)
                
                // Show the survey result in another alert
                let resultAlert = UIAlertController(title: "Survey Result", message: "\(surveyResult)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                resultAlert.addAction(okAction)
                self.present(resultAlert, animated: true, completion: nil)
            }

            alert.addAction(submitAction)
            present(alert, animated: true, completion: nil)
        }
    }
}
             
