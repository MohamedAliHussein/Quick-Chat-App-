//
//  RegisterViewController.swift
//  QuickChat
//
//  Created by Mohamed Ali on 2/25/19.
//  Copyright © 2019 mohamed ali. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {
    @IBOutlet weak var confirmPasswordTextfield: UITextField!
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let chatVC = segue.destination as? ChatViewController {
            chatVC.email = self.emailTextfield.text ?? ""
        }
    }
    @IBAction func registerPressed(_ sender: Any) {
        
        if self.passwordTextfield.text != self.confirmPasswordTextfield.text {
            let alert = UIAlertController(title: "Invalid input", message: "Passwords don't match", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            return
        }
        SVProgressHUD.show()
        
        //TODO: Set up a new user on our Firbase database
        
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            SVProgressHUD.dismiss()

            if error != nil {
                print(error!)
            }else {
                print("regestration seccessful!")
                
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
            
        }
    }
    }
    

