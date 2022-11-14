//
//  MainTableView.swift
//  Person_Test
//
//  Created by Stanislav Demyanov on 14.11.2022.
//

import UIKit

class MainTableView: UITableView {
    
    private var valueArray = [String]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        delegate = self
        dataSource = self
        
        register(MainTableViewCell.self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setValueArray(_ array: [String]) {
        valueArray = array
    }
}

// MARK: - UITableViewDataSource

extension MainTableView: UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resources.NameField.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(MainTableViewCell.self) else {
            return UITableViewCell()
        }
        
        let nameField = Resources.NameField.allCases[indexPath.row].rawValue
        //let value = UserDefaultHelper.getUserValue(Resources.NameField.allCases[indexPath.row].rawValue)
        let value = valueArray[indexPath.row]
        cell.configure(name: nameField, value: value)
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MainTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}


