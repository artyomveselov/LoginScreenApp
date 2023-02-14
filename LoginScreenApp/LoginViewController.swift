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
    
    private let userName = "Apple"
    private let password = "12345"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userTextField.text
        
    }
    
    @IBAction func logInButtonTapped() {
        guard userTextField.text == userName, passwordTextField.text == password else {
            showAlert(withTitle: "Ошибка!", andMessage: "Некорректный логин или пароль. Попробуйте ещё раз.")
            return
        }
    }
    
    @IBAction func forgotUserNameButton() {
        showAlert(withTitle:"Ваш логин", andMessage: userName)
    }
    
    @IBAction func forgotPasswordButton() {
        showAlert(withTitle: "Ваш пароль", andMessage: password)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userTextField.text = nil
        passwordTextField.text = nil
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
    

