//
//  LoginViewController.swift
//  AppChat
//
//  Created by Tiến Nguyễn Văn on 18/12/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "IconApp")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
    private var emailInput: UITextField = {
        let emailInput = UITextField()
        emailInput.autocapitalizationType = .none
        emailInput.autocorrectionType = .no
        emailInput.keyboardType = .emailAddress
        emailInput.layer.borderWidth = 1
        emailInput.layer.borderColor = UIColor.gray.cgColor
        emailInput.layer.cornerRadius = 16
        emailInput.placeholder = "Enter email ..."
        emailInput.returnKeyType = .continue
        emailInput.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        emailInput.leftViewMode = .always
        emailInput.backgroundColor = .white
        return emailInput
    }()
    
    private var passwordInput: UITextField = {
        let passwordInput = UITextField()
        passwordInput.autocorrectionType = .no
        passwordInput.autocapitalizationType = .none
        passwordInput.layer.borderWidth = 1
        passwordInput.layer.borderColor = UIColor.gray.cgColor
        passwordInput.layer.cornerRadius = 16
        passwordInput.placeholder = "Enter password ..."
        passwordInput.returnKeyType = .done
        passwordInput.isSecureTextEntry = true
        passwordInput.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        passwordInput.leftViewMode = .always
        passwordInput.backgroundColor = .white
        return passwordInput
    }()
    
    private var buttonLogin: UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        button.layer.cornerRadius = 16
        button.setTitle("Login now", for: .normal)
        button.layer.masksToBounds = true
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Login"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register", style: .done, target: self, action: #selector(onPressRegister))
        view.backgroundColor = .white
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailInput)
        scrollView.addSubview(passwordInput)
        scrollView.addSubview(buttonLogin)
        emailInput.delegate = self
        passwordInput.delegate = self
        buttonLogin.addTarget(self, action: #selector(onPressLogin), for: .touchUpInside)
        view.addSubview(scrollView)
    }
    
    @objc func onPressLogin() {
        emailInput.resignFirstResponder()  // dimiss keyboard for form email
        passwordInput.resignFirstResponder() // dimiss keyboard for form password
        guard let email = emailInput.text, let password = passwordInput.text, !email.isEmpty, !password.isEmpty, password.count >= 8 else {
            handleShowMessageError()
            return
        }
    }
    
    func handleShowMessageError() {
        let alert = UIAlertController(title: "Message", message: "Please enter email and password", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
    }
    
    @objc func onPressRegister() {
        let registerScreen = RegisterViewController()
        navigationController?.pushViewController(registerScreen, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        scrollView.frame = view.bounds
        let sizeImageView = view.width/3
        let leftImageView = view.width/2 - sizeImageView/2
        imageView.frame = CGRect(x: leftImageView, y: view.height/12, width: sizeImageView, height: sizeImageView)
        let widthInputView = view.width - 50
        emailInput.frame = CGRect(
            x: 25,
            y: imageView.bottom + 80,
            width: widthInputView,
            height: 50
        )
        passwordInput.frame = CGRect(
            x: 25,
            y:emailInput.bottom + 20,
            width: widthInputView,
            height: 50
        )
        let widthButtonLogin = view.width - 50
        buttonLogin.frame = CGRect(x: (view.width - widthButtonLogin) / 2, y: passwordInput.bottom + 80, width: widthButtonLogin, height: 52)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailInput {
            passwordInput.becomeFirstResponder()
        } else if(textField == passwordInput) {
            onPressLogin()
        }
        return true
    }
}
