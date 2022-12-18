//
//  ViewController.swift
//  AppChat
//
//  Created by Tiến Nguyễn Văn on 23/11/2022.
//

import UIKit

class ConversationsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Call when UI pre applied
        super.viewWillAppear(animated)
        title = "Convensition"
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) { // Like onResume in android
        // Call when UI applied
        super.viewDidAppear(animated)
       // let user = UserDefaults.standard.string(forKey: "logined")
        guard UserDefaults.standard.string(forKey: "logined") != nil else {
            let loginController = UINavigationController(rootViewController: LoginViewController())
            loginController.modalPresentationStyle = .fullScreen
            present(loginController, animated: true)
            return
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Call when pre view remove
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // Call when view removed
    }
}

