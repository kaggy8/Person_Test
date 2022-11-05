//
//  UIView+ Extensions.swift
//  Person_Test
//
//  Created by Stanislav Demyanov on 06.11.2022.
//

import UIKit

extension UIView {
    func addView(_ view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
