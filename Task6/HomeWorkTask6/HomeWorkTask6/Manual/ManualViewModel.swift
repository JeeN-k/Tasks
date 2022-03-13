//
//  ManualViewModel.swift
//  HomeWorkTask6
//
//  Created by Oleg Stepanov on 13.03.2022.
//

import Foundation

class ManualViewModel {
    var cellModel: [CellViewModel] = []
    
    func fetchCourses(screenSize: Float, completion: @escaping(() -> ())) {
        cellModel = Course.courses.map( { course in
            CellViewModel(course: course, screenWidth: screenSize)
        })
    }
}
