//
//  SignUpViewController.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class SignUpViewController: UINavigationController, SignUpViewProtocol {
	var presenter: SignUpPresenterProtocol?
}

extension SignUpViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.presenter?.start()
        }
    }
}
