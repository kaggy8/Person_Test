//
//  MainViewController.swift
//  Person_Test
//
//  Created by Stanislav Demyanov on 06.11.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        if #available(iOS 13.0, *) {
            imageView.image = UIImage(systemName: "person.circle")
        } else {
            imageView.image = UIImage(named: "person.circle")
        }
        
        return imageView
    }()
    
    private let mainTableView = MainTableView()
    
    private var userModel = UserModel()

    
    override func viewWillLayoutSubviews() {
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        getUserModel()
        getUserData()
        setValueArray()
    }
    
    private func setupViews() {
        title = "Просмотр"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Редактировать",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(editingTapped))
        
        view.addView(userPhotoImageView)
        view.addView(mainTableView)
    }
    
    @objc private func editingTapped() {
        let editingTableViewController = EditingViewController(userModel, userPhoto: userPhotoImageView.image)
        navigationController?.pushViewController(editingTableViewController, animated: true)
    }
    
    private func getUserModel() {
        userModel = UserDefaultHelper.getUserModel()
    }
    
    private func getUserData() {
        let userPhoto = UserDefaultHelper.loadUserImage()
        userPhotoImageView.image = userPhoto
    }
    
    public func saveEditModel(_ model: UserModel) {
        UserDefaultHelper.saveUserValue(Resources.NameField.firstName.rawValue, model.firstName)
        UserDefaultHelper.saveUserValue(Resources.NameField.secondName.rawValue, model.secondName)
        UserDefaultHelper.saveUserValue(Resources.NameField.thirdName.rawValue, model.thirdName)
        UserDefaultHelper.saveUserValue(Resources.NameField.birthday.rawValue, model.birthday)
        UserDefaultHelper.saveUserValue(Resources.NameField.gender.rawValue, model.gender)
    }
    
    private func getValueArray() -> [String] {
        var valueArray = [String]()
        
        for key in Resources.NameField.allCases {
            let value = UserDefaultHelper.getUserValue(key.rawValue)
            valueArray.append(value)
        }
        
        return valueArray
    }
    
    private func setValueArray() {
        let valueArray = getValueArray()
        mainTableView.setValueArray(valueArray)
        mainTableView.reloadData()
    }
    
    public func changeUserModel(model: UserModel) {
        saveEditModel(model)
        userModel = model
        setValueArray()
        mainTableView.reloadData()
    }
    
    public func changeUserPhoto(image: UIImage?) {
        userPhotoImageView.image = image
        guard let image = image else { return }
        UserDefaultHelper.saveUserImage(image: image)
    }
}

// MARK: - Set Constraints

extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            userPhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            userPhotoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 100),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            mainTableView.topAnchor.constraint(equalTo: userPhotoImageView.bottomAnchor, constant: 10),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
