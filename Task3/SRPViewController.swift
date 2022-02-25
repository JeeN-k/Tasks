//
//  SRPViewController.swift
//  SOLIDDRYKISS
//
//  Created by Александров Роман Витальевич on 09.02.2022.
//

import Foundation
import UIKit

class SRPViewController: UIViewController {
    
    var calculator: Calculator = NutrientCalculator()
    var targetCalories: Int?
    var nutrients: Nutrients?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        targetCalories = calculator.getTargetCalories(proportionType: .keto)
        nutrients = calculator.getNutrients(caloriesCalculatorType: .harrisBenedict, targetCalories: targetCalories)
    }
}

protocol Calculator {
    func getTargetCalories(proportionType: ProportionType) -> Int
    func getNutrients(caloriesCalculatorType: CaloriesCalculationType, targetCalories: Int) -> Nutrients
}

class NutrientCalculator: Calculator {
    func getTargetCalories(proportionType: ProportionType) -> Int {
        switch proportionType {
        case .paleo:
            return 1200
        case .keto:
            return 1000
        }
    }
    
    func getNutrients(caloriesCalculatorType: CaloriesCalculationType, targetCalories: Int) -> Nutrients {
        switch caloriesCalculatorType {
        case .mifflin:
            return Nutrients(carbs: 40, fats: 2, proteins: 10)
        case .harrisBenedict:
            return Nutrients(carbs: 20, fats: 2, proteins: 5)
        }
    }
}

struct Nutrients {
    var carbs: Int
    var fats: Int
    var proteins: Int
}

enum ProportionType {
    case paleo
    case keto
}

enum CaloriesCalculationType {
    case mifflin
    case harrisBenedict
}


