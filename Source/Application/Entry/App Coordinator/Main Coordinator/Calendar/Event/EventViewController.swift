//
//  EventViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class EventViewController: UIViewController, EventViewProtocol {
	var presenter: EventPresenterProtocol?
    
    deinit {
        print("deinitialized event screen")
    }
}
