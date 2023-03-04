//
//  ViewController.swift
//  Instagram
//
//  Created by kibum on 2023/02/14.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        handleNotAuthenticated();
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated();

    }
    private func handleNotAuthenticated() {
        if Auth.auth().currentUser == nil {
            // show log in
            let loginVC = LoginViewController();
            loginVC.modalPresentationStyle = .fullScreen;
            present(loginVC, animated: false);
        }
    }

}

