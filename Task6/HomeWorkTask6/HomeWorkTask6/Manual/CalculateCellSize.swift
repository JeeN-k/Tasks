//
//  CalculateCellSize.swift
//  HomeWorkTask6
//
//  Created by Oleg Stepanov on 13.03.2022.
//

import Foundation
import UIKit

final class CalculateCellHeight {
    func sizes(course: Course, screenWidth: Float) -> Float {
        let nameSize = course.name.height(withWidth: CGFloat(screenWidth), font: UIFont.systemFont(ofSize: 20))
        let stockSize: CGFloat = 35
        let moreSize: CGFloat = 16
        let plusButtonSize: CGFloat = 40
        let spacesSize: CGFloat = 65
        return Float(nameSize + stockSize + moreSize + plusButtonSize + spacesSize)
    }
}
