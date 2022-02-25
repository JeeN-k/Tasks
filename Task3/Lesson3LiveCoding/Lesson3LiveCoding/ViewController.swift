//
//  ViewController.swift
//  Lesson3LiveCoding
//
//  Created by Oleg Stepanov on 22.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var nameValidater = ValidateView(validateType: .name)
    private lazy var emailValidater = ValidateView(validateType: .email)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}


// MARK: - Private methods
extension ViewController {
    private func configureView() {
        view.backgroundColor = .systemBackground
        view.addSubview(nameValidater)
        view.addSubview(emailValidater)
        
        nameValidater.translatesAutoresizingMaskIntoConstraints = false
        emailValidater.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameValidater.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameValidater.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameValidater.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            emailValidater.topAnchor.constraint(equalTo: nameValidater.bottomAnchor, constant: 20),
            emailValidater.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailValidater.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
        ])
    }
}

