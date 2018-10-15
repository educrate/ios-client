//
//  UIImageView+Additions.swift
//  Client
//
//  Created by Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit.UIImageView

extension UIImageView {
    func round() {
        layer.cornerRadius = frame.width / 2
        clipsToBounds = true
    }
}