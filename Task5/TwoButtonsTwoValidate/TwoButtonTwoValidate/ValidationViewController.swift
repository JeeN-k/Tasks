//
//  ValidationViewController.swift
//  TwoButtonTwoValidate
//
//  Created by Oleg Stepanov on 22.02.2022.
//

import UIKit

class ValidationViewController: UIViewController {
    let validateView: ValidateView!
    
    let customView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemCyan
        return view
    }()
    
    init(validateView: ValidateView) {
        self.validateView = validateView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}


// MARK: - Private methods
extension ValidationViewController {
    private func configureView() {
        view.addSubview(validateView)
        
        validateView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            validateView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            validateView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            validateView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}

