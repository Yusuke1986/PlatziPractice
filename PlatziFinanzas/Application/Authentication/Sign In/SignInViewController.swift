//
//  SignInViewController.swift
//  PlatziFinanzas
//
//  Created by 松岡裕介 on 2019/04/09.
//  Copyright © 2019 Platzi. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var viewModel = SignInViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        viewModel.authAccountKit(sender: self) { (success, error) in
//
//        }
//    }
    
    
    @IBAction func signin(_ sender: Any) {
        
        SignInViewModel.signInWith(
            email: emailTextField.text,
            password: passwordTextField.text
        ) { [weak self] (success, error) in
            
            if let error = error {
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(ok)
                self?.present(alert, animated: true, completion: nil)
                return
            }
            
            if success {
                self?.performSegue(withIdentifier: "goToMain", sender: self)
            }
        }
    }
    
    
    @IBAction func facebookLogin(_ sender: Any) {
        SignInViewModel.facebookLogin(viewController: self, handler: { [weak self] (success, error) in
            if let error = error {
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(ok)
                self?.present(alert, animated: true, completion: nil)
                return
            }
            
            if success {
                self?.performSegue(withIdentifier: "goToMain", sender: self)
            }
        })
    }
    
    
//        guard let email = emailTextField.text,
//            validate(text: email, regex: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}") else {
//                return
//        }
//
//        guard let password = passwordTextField.text,
//            validate(text: password, regex: "^(?=.*[a-z])(?=.*\\d).{5,}$") else {
//                return
//        }
//
//        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
//            if let error = error {
//                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
//                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
//                alert.addAction(ok)
//                self?.present(alert, animated: true, completion: nil)
//                return
//            }
//            if result != nil {
//                self?.performSegue(withIdentifier: "goToMain", sender: self)
//            }
//        }
//
//    }
//
//    private func validate(text: String, regex: String) -> Bool {
//        let range = NSRange(location: 0, length: text.count)
//        let regex = try? NSRegularExpression(pattern: regex)
//        return regex?.firstMatch(in: text, options: [], range: range) != nil
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


