//
//  UIDropdownConfiguration.swift
//  Client
//
//  Created by Ampe on 11/1/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

struct UIDropdownConfiguration {
    let text: String
    let placeholder: String
    let textColor: UIColor
    let cursorColor: UIColor
    let placeholderColor: UIColor
    let textAlignment: NSTextAlignment
    
    init(text: String = "",
         placeholder: String = "",
         textColor: UIColor = .black,
         cursorColor: UIColor = .lightGray,
         placeholderColor: UIColor = .lightGray,
         textAlignment: NSTextAlignment = .left) {
        
        self.text = text
        self.placeholder = placeholder
        self.textColor = textColor
        self.cursorColor = cursorColor
        self.placeholderColor = placeholderColor
        self.textAlignment = textAlignment
    }
}

extension UIDropdownConfiguration {
    static let `default` = UIDropdownConfiguration()
}
