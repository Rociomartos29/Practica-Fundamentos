//
//  LoginViewController.swift
//  PracticaRocío
//
//  Created by Rocio Martos on 15/1/24.
//
import UIKit

class LoginViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var EmailLogin: UILabel!
    
    @IBOutlet weak var ContraseñaLabel: UILabel!
    
    @IBOutlet weak var LoginBoton: UIButton!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - UI Setup
    private func setupUI() {
        // Customize UI elements if needed
    }

    // MARK: - Actions
    @IBAction private func loginButtonTapped(_ sender: UIButton) {
        attemptLogin()
    }

    // MARK: - Login Logic
    private func attemptLogin() {
        guard let username = EmailLogin.text, !username.isEmpty,
              let password = ContraseñaLabel.text, !password.isEmpty else {
            // Show an alert or handle the case where username or password is empty
            return
        }

        // Call the login API method from your NetworkService
        NetworkService.shared.login(username: username, password: password) { [weak self] user, error in
            if let user = user {
                // Login successful, navigate to the next screen (e.g., list of heroes)
                DispatchQueue.main.async {
                    self?.navigateToHeroes()
                }
            } else if let error = error {
                // Handle the login error, show an alert or update UI accordingly
                print("Login error: \(error)")
            }
        }
    }

    // MARK: - Navigation
    private func navigateToHeroes() {
        let heroesViewController = HeroesViewController()
        navigationController?.pushViewController(heroesViewController, animated: true)
    }
}
