//
//  EditingTableView.swift
//  Person_Test
//
//  Created by Stanislav Demyanov on 08.11.2022.
//

import UIKit

final class EditingTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        register(TextViewTableViewCell.self, forCellReuseIdentifier: TextViewTableViewCell.idTextViewCell)
        register(DatePickerTableViewCell.self, forCellReuseIdentifier: DatePickerTableViewCell.idDatePickerCell)
        register(PickerViewTableViewCell.self, forCellReuseIdentifier: PickerViewTableViewCell.idPickerViewCell)
        
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UITableViewDataSource

extension EditingTableView: UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resources.NameField.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nameField = Resources.NameField.allCases[indexPath.row].rawValue
        
        switch indexPath.row {
        case 0...2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TextViewTableViewCell.idTextViewCell, for: indexPath) as? TextViewTableViewCell else {
                return UITableViewCell()
            }
            
            cell.nameTextViewDelegate = self
            if indexPath.row == 1 {
                cell.configure(name: nameField, scrollEnabled: false)
            } else {
                cell.configure(name: nameField, scrollEnabled: true)
            }
            
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DatePickerTableViewCell.idDatePickerCell, for: indexPath) as? DatePickerTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(name: nameField)
            
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PickerViewTableViewCell.idPickerViewCell, for: indexPath) as? PickerViewTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(name: nameField)
            
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDataSource

extension EditingTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}

// MARK: -NameTextViewDelegate

extension EditingTableView: NameTextViewProtocol {
    func changeSize() {
        beginUpdates()
        endUpdates()
    }
}
