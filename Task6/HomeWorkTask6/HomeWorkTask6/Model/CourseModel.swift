//
//  CourseModel.swift
//  HomeWorkTask6
//
//  Created by Oleg Stepanov on 11.03.2022.
//

import Foundation


struct Course {
    var stock: String
    var name: String
    var price: String
    
    static let courses: [Course] = [Course(stock: "Первые три занятия беcплатно", name: "Backend разработка", price: "7 840P"),
                                    Course(stock: "1.02.2022 - 1.04.2022 Скидка 10%", name: "Курсы по Android разроботке", price: "9 800P"),
                                    Course(stock: "Все бесплатно", name: "Курсы по iOS разработке + Computer Science +  Computer Vision + System Design", price: "11 760P"),
                                    Course(stock: "Все бесплатно", name: "Курсы по Android разработке + Алгоритмы + SQL + HTML", price: "Миллион, не меньше P")]
}
