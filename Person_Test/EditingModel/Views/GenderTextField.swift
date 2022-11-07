//
//  GenderTextField.swift
//  Person_Test
//
//  Created by Stanislav Demyanov on 07.11.2022.
//

import UIKit

class GenderTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textAlignment = .right
        tintColor = .clear
        let font = Resources.Fonts.avenirNextRegular(with: 18)
        attributedPlaceholder = NSAttributedString(string: "Введите данные",
                                                   attributes: [.foregroundColor: UIColor.lightGray,
                                                                .font: font as Any])
    }
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        !isFirstResponder
    }
}
