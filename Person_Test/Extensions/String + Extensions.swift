//
//  String + Extensions.swift
//  Person_Test
//
//  Created by Stanislav Demyanov on 10.11.2022.
//

import Foundation

extension String {
    func getDateFromString() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let date = dateFormatter.date(from: self) ?? Date()
        return date
    }
}
