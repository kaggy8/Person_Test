//
//  Resource.swift
//  Person_Test
//
//  Created by Stanislav Demyanov on 06.11.2022.
//

import Foundation

enum Resources {
    
    enum NameField: String, CaseIterable {
        case firstName = "Имя"
        case secondName = "Фамилия"
        case thirdName = "Отчество"
        case dateBirthday = "Дата рождения"
        case gender = "Пол"
    }
}
