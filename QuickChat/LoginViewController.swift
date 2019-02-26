//
//  LoginViewController.swift
//  QuickChat
//
//  Created by Mohamed Ali on 2/25/19.
//  Copyright © 2019 mohamed ali. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LoginViewController: UIViewController {

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
        
        if let chatVC = segue.destination as? ChatViewController {
            chatVC.email = self.emailTextfield.text ?? ""
        }
    }
    @IBAction func loginPressed(_ sender: Any) {
        
        SVProgressHUD.show()
        
        
        //TODO: Log in the user
        
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            SVProgressHUD.dismiss()

            if error != nil {
                print(error!)
            }else{
                print("login success ! ")
                
                
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
    }
    
}
