//
//  LoginViewController.swift
//  PracticaRocío
//
//  Created by Rocio Martos on 15/1/24.
//

import UIKit
class LoginViewController: UIViewController {

  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func loginButtonTapped(_ sender: Any) {
    guard let username = usernameTextField.text,
          let password = passwordTextField.text else {
      return
    }
    
    HeroService.shared.login(username: username, password: password) { result in
      switch result {
          
             case .success(let token):
               // Navegar a la pantalla principal
               let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = mainStoryboard.instantiateInitialViewController()
               self.present(vc!, animated: true)
               
             case .failure(let error):
               // Mostrar alerta de error
               let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default))
               self.present(alert, animated: true)
             }
           }
         }

       }
