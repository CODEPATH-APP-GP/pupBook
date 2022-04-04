//
//  LoginViewController.swift
//  Pupbook
//
//  Created by Juan Jose Gomez Medina on 3/22/22.
//

import UIKit
import AlamofireImage
import Parse

class LoginViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signinButton(_ sender: Any) {
            
            let username = usernameTextField.text!
            let password = passwordTextField.text!
            
            PFUser.logInWithUsername(inBackground: username, password: password){(user,error) in
                if user != nil{
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
                else{
                    print("Error \(String(describing: error?.localizedDescription))")
                }
            }
            
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
