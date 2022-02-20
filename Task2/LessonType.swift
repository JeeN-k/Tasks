import UIKit

enum LessonType {
    case math(rating: Int)
    case nativeLanguage(rating: Int)
    case computerSince(rating: Int)
    case literature(rating: Int)
}

extension LessonType {
    
    static func >=(lhs: LessonType, rhs: LessonType) -> Bool {
        switch(lhs, rhs) {
        case let (.math(a), .math(b)):
            return a >= b
        case let (.nativeLanguage(a), .nativeLanguage(b)):
            return a >= b
        case let (.computerSince(a), .computerSince(b)):
            return a >= b
        case let (.literature(a), .literature(b)):
            return a >= b
        default:
            return false
        }
    }
    
    static func <=(lhs: LessonType, rhs: LessonType) -> Bool {
        switch(lhs, rhs) {
        case let (.math(a), .math(b)):
            return a <= b
        case let (.nativeLanguage(a), .nativeLanguage(b)):
            return a <= b
        case let (.computerSince(a), .computerSince(b)):
            return a <= b
        case let (.literature(a), .literature(b)):
            return a <= b
        default:
            return false
        }
    }
    
    static func <(lhs: LessonType, rhs: LessonType) -> Bool {
        switch(lhs, rhs) {
        case let (.math(a), .math(b)):
            return a < b
        case let (.nativeLanguage(a), .nativeLanguage(b)):
            return a < b
        case let (.computerSince(a), .computerSince(b)):
            return a < b
        case let (.literature(a), .literature(b)):
            return a < b
        default:
            return false
        }
    }
    
    static func >(lhs: LessonType, rhs: LessonType) -> Bool {
        switch(lhs, rhs) {
        case let (.math(a), .math(b)):
            return a > b
        case let (.nativeLanguage(a), .nativeLanguage(b)):
            return a > b
        case let (.computerSince(a), .computerSince(b)):
            return a > b
        case let (.literature(a), .literature(b)):
            return a > b
        default:
            return false
        }
    }
    
    static func ==(lhs: LessonType, rhs: LessonType) -> Bool {
        switch(lhs, rhs) {
        case let (.math(a), .math(b)):
           return a == b
        case let (.nativeLanguage(a), .nativeLanguage(b)):
            return a == b
        case let (.computerSince(a), .computerSince(b)):
            return a == b
        case let (.literature(a), .literature(b)):
            return a == b
        default:
            return false
        }
    }
    
}
