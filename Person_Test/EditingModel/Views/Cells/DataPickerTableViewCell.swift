//
//  DataPickerTableViewCell.swift
//  Person_Test
//
//  Created by Stanislav Demyanov on 07.11.2022.
//

import UIKit

class DataPickerTableViewCell: UITableViewCell {
    
    static var idDatePickerCell = "idDatePickerCell"
    
    private let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        selectionStyle = .none
        nameLabel.font = Resources.Fonts.avenirNextRegular(with: 18)
        
        addView(nameLabel)
    }
    
    public func configure(name: String, scrollEnabled: Bool) {
        nameLabel.text = name
    }
}

// MARK: - Set constraints

extension DataPickerTableViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35)
        ])
    }
}
