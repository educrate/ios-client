//
//  UIFieldDelegate.swift
//  UIField
//
//  Created by Ampe on 7/28/18.
//

import UIKit

protocol UIFieldDelegate {
    func editingBegan(_ sender: UIField)
    func textChanged(_ sender: UIField)
    func editingEnded(_ sender: UIField)
}