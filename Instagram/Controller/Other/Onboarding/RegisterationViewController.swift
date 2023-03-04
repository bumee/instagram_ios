//
//  RegisterationViewController.swift
//  Instagram
//
//  Created by kibum on 2023/02/14.
//

import UIKit

class RegisterationViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius : CGFloat = 8.0;
    }
    
    private let usernameField: UITextField = {  
        let field = UITextField();
        field.placeholder = "Username ...";
        field.returnKeyType = .continue;
        field.leftViewMode = .always;
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0));
        field.autocapitalizationType = .none;
        field.autocorrectionType = .no;
        field.layer.masksToBounds = true;
        field.layer.cornerRadius = Constants.cornerRadius;
        field.backgroundColor = .secondarySystemBackground;
        field.layer.borderWidth = 1.0;
        field.layer.borderColor = UIColor.secondaryLabel.cgColor;
        return field;
    }()
    
    private let emailField: UITextField = {
        let field = UITextField();
        field.placeholder = "Email...";
        field.returnKeyType = .continue;
        field.leftViewMode = .always;
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0));
        field.autocapitalizationType = .none;
        field.autocorrectionType = .no;
        field.layer.masksToBounds = true;
        field.layer.cornerRadius = Constants.cornerRadius;
        field.backgroundColor = .secondarySystemBackground;
        field.layer.borderWidth = 1.0;
        field.layer.borderColor = UIColor.secondaryLabel.cgColor;
        return field;
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField();
        field.placeholder = "Password...";
        field.returnKeyType = .next;
        field.leftViewMode = .always;
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0));
        field.autocapitalizationType = .none;
        field.autocorrectionType = .no;
        field.layer.masksToBounds = true;
        field.layer.cornerRadius = Constants.cornerRadius;
        field.backgroundColor = .secondarySystemBackground;
        field.isSecureTextEntry = true;
        field.layer.borderWidth = 1.0;
        field.layer.borderColor = UIColor.secondaryLabel.cgColor;
        return field;
    }()
    
    private let registerButton: UIButton = {
        let button =  UIButton();
        button.setTitle("Sign Up", for: .normal);
        button.layer.masksToBounds = true;
        button.layer.cornerRadius = Constants.cornerRadius;
        button.backgroundColor = .systemGreen;
        button.setTitleColor(.white, for: .normal);
        return button;
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside )
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        view.addSubview(emailField)
        view.addSubview(registerButton)
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        usernameField.delegate = self
        passwordField.delegate = self
        emailField.delegate = self
        usernameField.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 10, width: view.width - 40  , height: 52)
        emailField.frame = CGRect(x: 20, y: usernameField.bottom + 10, width: view.width - 40  , height: 52)
        passwordField.frame = CGRect(x: 20, y: emailField.bottom + 10, width: view.width - 40  , height: 52)
        registerButton.frame = CGRect(x: 20, y: passwordField.bottom + 10, width: view.width - 40  , height: 52)
         
    }
    
    @objc private func didTapRegister(){
        usernameField.resignFirstResponder()
        passwordField.resignFirstResponder()
        emailField.resignFirstResponder()
        
        guard let email = emailField.text, !email.isEmpty,
              let username = usernameField.text, !username.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8 else { return }
        
        AuthManager.shared.registerNewUser(username: username, email: email, password: password){ registered in
            DispatchQueue.main.async {
                if registered {
                    return
                }
                else{
                    return
                }
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

extension RegisterationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField{
            emailField.becomeFirstResponder()
        }
        else if textField == emailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            didTapRegister()
        }
        
        return true;
    }
}
