//
//  UIViewController + Extensions.swift
//  Person_Test
//
//  Created by Stanislav Demyanov on 08.11.2022.
//

import UIKit

extension UIViewController {
    func presentSimpleAlert(title: String, message: String?) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
