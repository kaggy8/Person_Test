//
//  UserDefaultHelper.swift
//  Person_Test
//
//  Created by Stanislav Demyanov on 08.11.2022.
//

import Foundation

final class UserDefaultHelper {
    private static let defaults = UserDefaults.standard
    private static let userSessionKey = "userKey"
    
    static func getUserDictionary() -> [String: String] {
        defaults.value(forKey: userSessionKey) as? [String: String] ?? [:]
    }
    
    static func saveUserValue(_ key: String, _ value: String) {
        var userDictionary = getUserDictionary()
        userDictionary[key] = value
        defaults.set(userDictionary, forKey: userSessionKey)
    }
    
    static func getUserModel() -> UserModel {
        var userModel = UserModel()
        let userDictionary = getUserDictionary()
        userModel.firstName = userDictionary[Resources.NameField.firstName.rawValue] ?? ""
        userModel.secondName = userDictionary[Resources.NameField.secondName.rawValue] ?? ""
        userModel.thirdName = userDictionary[Resources.NameField.thirdName.rawValue] ?? ""
        userModel.birthday = userDictionary[Resources.NameField.birthday.rawValue] ?? ""
        userModel.gender = userDictionary[Resources.NameField.gender.rawValue] ?? ""
        
        return userModel
    }
    
    static func getUserValue(_ key: String) -> String {
        let userDictionary = getUserDictionary()
        let stringValue = userDictionary[key] ?? ""
        
        return stringValue
    }
}
