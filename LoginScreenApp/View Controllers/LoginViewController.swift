//
//  LoginViewController.swift
//  LoginScreenApp
//
//  Created by temaveselov on 14.02.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    private let user = User.getUserInformation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTextField.text = user.userName
        passwordTextField.text = user.password
        loginButton.layer.cornerRadius = 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let userNavigationVC = viewController as? UINavigationController {
                guard let userVC = userNavigationVC.topViewController as? UserViewController else { return }
                userVC.user = user
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    @IBAction func logInButtonPressed() {
        user.userName == userTextField.text || user.password == passwordTextField.text
        ? performSegue(withIdentifier: "openWelcomeVC", sender: nil)
        : showAlert(
            withTitle: "Неверный пароль или логин",
            andMessage: "Пожалуйста, попробуйте ещё раз"
        )
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(withTitle: "Напоминаем", andMessage: "Вас зовут \(user.userName)")
        : showAlert(withTitle: "Напоминаем", andMessage: "Ваш пароль \(user.password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userTextField.text = ""
        passwordTextField.text = ""
    }
}


extension LoginViewController {
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
