//
//  RegisterViewController.swift
//  AppChat
//
//  Created by Tiến Nguyễn Văn on 18/12/2022.
//

import UIKit

class RegisterViewController: UIViewController {
    
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
    
    private var firstNameInput: UITextField = {
        let firstNameInput = UITextField()
        firstNameInput.autocapitalizationType = .none
        firstNameInput.autocorrectionType = .no
        firstNameInput.keyboardType = .emailAddress
        firstNameInput.layer.borderWidth = 1
        firstNameInput.layer.borderColor = UIColor.gray.cgColor
        firstNameInput.layer.cornerRadius = 16
        firstNameInput.placeholder = "Enter first name ..."
        firstNameInput.returnKeyType = .continue
        firstNameInput.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        firstNameInput.leftViewMode = .always
        firstNameInput.backgroundColor = .white
        return firstNameInput
    }()
    
    private var lastNameInput: UITextField = {
        let lastNameInput = UITextField()
        lastNameInput.autocapitalizationType = .none
        lastNameInput.autocorrectionType = .no
        lastNameInput.keyboardType = .emailAddress
        lastNameInput.layer.borderWidth = 1
        lastNameInput.layer.borderColor = UIColor.gray.cgColor
        lastNameInput.layer.cornerRadius = 16
        lastNameInput.placeholder = "Enter last name ..."
        lastNameInput.returnKeyType = .continue
        lastNameInput.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        lastNameInput.leftViewMode = .always
        lastNameInput.backgroundColor = .white
        return lastNameInput
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
    
    private var buttonRegister: UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        button.layer.cornerRadius = 16
        button.setTitle("Login now", for: .normal)
        button.layer.masksToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        scrollView.addSubview(imageView)
        scrollView.addSubview(firstNameInput)
        scrollView.addSubview(lastNameInput)
        scrollView.addSubview(emailInput)
        scrollView.addSubview(passwordInput)
        scrollView.addSubview(buttonRegister)
        firstNameInput.delegate = self
        lastNameInput.delegate = self
        emailInput.delegate = self
        passwordInput.delegate = self
        buttonRegister.addTarget(self, action: #selector(onPressRegister), for: .touchUpInside)
        view.addSubview(scrollView)
    }
    
    @objc func onPressRegister() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Register"
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(onBackPress))
    }
    
    override func viewDidLayoutSubviews() {
        scrollView.frame = view.bounds
        let sizeImageView = view.width/3
        let leftImageView = view.width/2 - sizeImageView/2
        imageView.frame = CGRect(x: leftImageView, y: view.height/12, width: sizeImageView, height: sizeImageView)
        let widthInputView = view.width - 50
        firstNameInput.frame = CGRect(
            x: 25,
            y: imageView.bottom + 80,
            width: widthInputView,
            height: 50
        )
        lastNameInput.frame = CGRect(
            x: 25,
            y: firstNameInput.bottom + 20,
            width: widthInputView,
            height: 50
        )
        emailInput.frame = CGRect(
            x: 25,
            y: lastNameInput.bottom + 20,
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
        buttonRegister.frame = CGRect(x: (view.width - widthButtonLogin) / 2, y: passwordInput.bottom + 80, width: widthButtonLogin, height: 52)
    }
    
    @objc func onBackPress() {
        navigationController?.popViewController(animated: true)
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailInput {
            passwordInput.becomeFirstResponder()
        } else if(textField == passwordInput) {
           // onPressLogin()
        }
        return true
    }
}
