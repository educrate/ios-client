//
//  SelectCollegeViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/10/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

protocol SelectCollegeViewControllerDelegate: class {
    func selectCollegeViewController(_ selectCollegeViewController: SelectCollegeViewController, didSelect college: String)
}

class SelectCollegeViewController: UIViewController {
    
    // MARK: Viper
    var presenter: SelectCollegePresenterProtocol?
    
    // MARK: Coordinator
    weak var delegate: SelectCollegeViewControllerDelegate?
    
    // MARK: Views
    @IBOutlet private weak var collegeSelector: UIDropdownViewController!
}

private extension SelectCollegeViewController {
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        presenter?.showEnterStudentIdentifier()
    }
}

extension SelectCollegeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeSelector.setPlaceholder("Name of University")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collegeSelector.beginEditing()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueCase(for: segue) {
        case .dropdown:
            collegeSelector = segue.viewController()
            collegeSelector.delegate = self
        }
    }
}

// MARK: - Viper Methods
extension SelectCollegeViewController: SelectCollegeViewProtocol {
    func show(names: [String]) {
        collegeSelector.setDropdown(names)
    }
    
    func show(error: SelectCollegeError) {
        
    }
}

// MARK: - Dropdown Data Source & Delegate Conformance
extension SelectCollegeViewController: UIDropdownDelegate {
    var cellHeight: CGFloat {
        return 50
    }
    
    func inputChanged(_ sender: UITextField) {
        presenter?.updateView(for: sender.text)
    }
    
    func dropdown(_ dropdown: UITableView, didSelectRowAt indexPath: IndexPath) {
        collegeSelector.endEditing()
    }
}

extension SelectCollegeViewController: SegueIdentifiable {
    enum Segue: String {
        case dropdown
    }
}