# Survey-Form
 Simple Survey Form

This code is an implementation of a simple survey form. The form consists of three fields: name, age, and email. When the user taps the submit button, the app validates the user input and displays an alert with a message indicating whether the form has been successfully submitted or if any errors occurred.

The code declares three outlets that reference the three input fields in the form. These outlets are used later to retrieve the values entered by the user.

````
@IBOutlet weak var nameTextField: UITextField!
@IBOutlet weak var ageTextField: UITextField!
@IBOutlet weak var emailTextField: UITextField!
````

The viewDidLoad() method is a standard method in iOS view controllers that gets called when the view is loaded into memory. In this case, it's empty.

````
override func viewDidLoad() {
    super.viewDidLoad()
}
````

The submitButtonTapped() method is an action method that gets called when the user taps the submit button. It retrieves the values entered by the user in the form fields, validates the input, and shows an alert based on the validation result.

````
@IBAction func submitButtonTapped(_ sender: Any) {
    if let name = nameTextField.text,
       let ageString = ageTextField.text,
       let age = Int(ageString),
       let email = emailTextField.text {
       
        // Validation code goes here
    }
}
````

The code checks whether the name field is empty and displays an error message if it is.
````
if name.isEmpty {
    let alert = UIAlertController(title: "Error", message: "Name field is required.", preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    return
}
````

The code checks whether the email field is valid using a regular expression pattern. If the email is not valid, the code displays an error message.


````
let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
if !emailPredicate.evaluate(with: email) {
    let alert = UIAlertController(title: "Error", message: "Email address is invalid.", preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    return
}
````

If the input is valid, the code displays a success message and prints the survey results to the console. It also shows the survey results in another alert.

````
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
````

Overall, this code demonstrates a simple way to implement a form and validate user input in an iOS app.
