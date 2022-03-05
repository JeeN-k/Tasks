//
//  MainViewController.swift
//  TwoButtonTwoValidate
//
//  Created by Oleg Stepanov on 05.03.2022.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    let mailButton = RouteButton(text: "Валидация почты")
    let nameButton = RouteButton(text: "Валидация имени")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    @objc private func mailButtonTouched() {
        let vc = ValidationViewController(validateView: ValidateView(validateType: .email))
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc private func nameButtonTouched() {
        let vc = ValidationViewController(validateView: ValidateView(validateType: .name))
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainViewController {
    
    private func configureView() {
        title = "Select validation"
        view.backgroundColor = .systemBackground
        view.addSubview(mailButton)
        view.addSubview(nameButton)
        
        mailButton.addTarget(self, action: #selector(mailButtonTouched), for: .touchUpInside)
        nameButton.addTarget(self, action: #selector(nameButtonTouched), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            nameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nameButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            nameButton.heightAnchor.constraint(equalToConstant: 100),
            
            mailButton.topAnchor.constraint(equalTo: nameButton.bottomAnchor, constant: 20),
            mailButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            mailButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            mailButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
