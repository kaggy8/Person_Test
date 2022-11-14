//
//  UserModel.swift
//  Person_Test
//
//  Created by Stanislav Demyanov on 08.11.2022.
//

import Foundation

struct UserModel {
    var firstName = ""
    var secondName = ""
    var thirdName = ""
    var birthday = ""
    var gender = ""
    
    static func == (_ firstModel: UserModel, _ secondModel: UserModel) -> Bool {
        firstModel.firstName == secondModel.firstName &&
        firstModel.secondName == secondModel.secondName &&
        firstModel.thirdName == secondModel.thirdName &&
        firstModel.birthday == secondModel.birthday &&
        firstModel.gender == secondModel.gender
    }
}
