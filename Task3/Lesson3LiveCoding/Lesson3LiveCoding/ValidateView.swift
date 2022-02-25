//
//  ValidateView.swift
//  Lesson3LiveCoding
//
//  Created by Oleg Stepanov on 25.02.2022.
//

import UIKit


enum ValidateType: String {
    case email = "почту"
    case name = "имя"
    
    var regex: String {
        switch self {
        case .email:
            return "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case .name:
            return "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
        }
    }
}

final class ValidateView: UIView {
    
    let validateType: ValidateType
    let regex: String
    
    init(validateType: ValidateType) {
        self.validateType = validateType
        regex = validateType.regex
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var validateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите \(validateType.rawValue)..."
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var validateButton: UIButton = {
        let button = UIButton.init(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Валидировать \(validateType.rawValue)", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(didTapValidateButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var validateResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ожидаю валидации..."
        return label
    }()
    
    @objc private func didTapValidateButton() {
        let regExString = regex
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: validateTextField.text)
        
        validateResultLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
        validateResultLabel.textColor = isValid ? .systemGreen : .systemRed
    }
}

extension ValidateView {
    
    private func configureView() {
        
        backgroundColor = .secondarySystemBackground
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 12
        layer.shadowOffset = CGSize(width: 2, height: 4)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        
        
        addSubview(validateTextField)
        addSubview(validateButton)
        addSubview(validateResultLabel)
        
        
        NSLayoutConstraint.activate([
            validateTextField.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            validateTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            validateTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            
            validateButton.topAnchor.constraint(equalTo: validateTextField.bottomAnchor, constant: 18),
            validateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            validateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            
            validateResultLabel.topAnchor.constraint(equalTo: validateButton.bottomAnchor, constant: 18),
            validateResultLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            validateResultLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18),
        ])
    }
    
}
