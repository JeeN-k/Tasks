import UIKit

enum ShooterGuns: String {
    case pistol = "Pistol"
    case rifle = "Rifle"
    case sniperRifle = "Sniper Rifle"
}

protocol Hero {
    var name: String { get }
    var power: Int { get set }
    func move()
}

protocol Defender: Hero {
    var protection: String { get }
    func blockAttack()
}

protocol Attacker: Hero {
    var gun: String { get }
    func attack()
}

extension Hero {
    func move() {
        print("\(name) moved")
    }
}

extension Attacker {
    func attack() {
        print("\(name) attacked with \(gun)")
    }
}

extension Defender {
    func blockAttack() {
        print("\(name) blocked attack with \(protection)")
    }
}

class SwordsmanHero: Attacker {
    var gun: String
    var name: String
    var power: Int
    
    init(name: String, power: Int) {
        self.gun = "Sword"
        self.name = name
        self.power = power
    }
}

class ShooterHero: Attacker {
    var gun: String
    var name: String
    var power: Int
    
    init(gun: ShooterGuns, name: String, power: Int) {
        self.gun = gun.rawValue
        self.name = name
        self.power = power
    }
    
}

class DefendHero: Defender {
    var protection: String
    var name: String
    var power: Int
    
    init(protection: String, name: String, power: Int) {
        self.protection = protection
        self.name = name
        self.power = power
    }
}

func fullAttack(with attackers: [Attacker]) {
    attackers.forEach { attacker in
        attacker.attack()
    }
}

let swordsman = SwordsmanHero(name: "Tom", power: 21)
let shooter = ShooterHero(gun: .sniperRifle, name: "Jhon", power: 40)
let sheilder = DefendHero(protection: "Shield", name: "Bob", power: 20)
let attackers: [Attacker] = [swordsman, shooter]
fullAttack(with: attackers)
sheilder.blockAttack()
