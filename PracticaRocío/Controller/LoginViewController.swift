//
//  LoginViewController.swift
//  PracticaRocío
//
//  Created by Rocio Martos on 15/1/24.
//

import UIKit
class MainTabBarController: UITabBarController {
    
    override
}

class LoginViewController: UIViewController {
    
    
    
    @IBOutlet weak var Email: UILabel!
    @IBOutlet weak var Password: UILabel!
    @IBOutlet weak var ImagenFondo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func LoginBoton(_ sender: Any) {
        guard let username = Email.text,
              let password = Password.text else {
            return
        }
        
    }
    let activityIndicator = UIActivityIndicatorView()
    var currentUser: User?
    
    // ...
    
    func loginDidSucceed(user: User) {
        
        // Ocultar indicator
        activityIndicator.stopAnimating()
        
        // Almacenar usuario
        currentUser = user
        
        // Descartar teclado
        Email.resignFirstResponder()
        Password.resignFirstResponder()
        
        // Mostrar alerta
        let successAlert = //...
        
        // Navegar a pantalla principal
        DispatchQueue.main.async {
            let mainTabBarController = MainTabBarController()
            self.navigationController?.pushViewController(mainTabBarController, animated: true)
        }
        
    }
    
    func loginDidFail(error: Error) {
        // Mostrar alerta de error
    }
    
    // En User.swift
    struct User {
        let name: String
        // otras propiedades
    }
    
    
    
    func loginUser() {
        
        guard let username = Email.text,
              let password = Password.text else {
            return
        }
        
        let loginVC = self
        
        APIService.login(loginVC: loginVC, username: username, password: password) { result in

          switch result {
            
            case .success(let user):
              self.loginDidSucceed(user: user)
              
            case .failure(let error):
              self.loginDidFail(error: error)
              
          }
        }

    }
}
fileprivate func loginDidSucceed(user: User) {

    let tabBarController = UITabBarController()
    

    tabBarController.viewControllers = [homeVC, profileVC]

    navigationController?.pushViewController(tabBarController, animated: true)
 principal
        }
        
fileprivate func loginDidFail(error: Error) {
            // mostrar alerta de error
        }
        


