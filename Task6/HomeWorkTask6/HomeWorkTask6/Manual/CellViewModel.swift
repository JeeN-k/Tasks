//
//  CellViewModel.swift
//  HomeWorkTask6
//
//  Created by Oleg Stepanov on 13.03.2022.
//

import Foundation
import UIKit

class CellViewModel {
    var course: Course
    var height: Float
    
    init(course: Course, screenWidth: Float) {
        self.course = course
        self.height = CalculateCellHeight().sizes(course: course, screenWidth: screenWidth)
    }
}
