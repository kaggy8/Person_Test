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
    
    func presentChangeAlert(completionHandler: @escaping(Bool) -> Void) {
        let alertController = UIAlertController(title: "Данные были изменены",
                                                message: "Вы желаете сохранить изменения?",
                                                preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { _ in
            completionHandler(true)
        }
        let skipAction = UIAlertAction(title: "Пропустить", style: .default) { _ in
            completionHandler(false)
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(skipAction)
        
        present(alertController, animated: true)
    }
}
