import UIKit

protocol Hero {
    var name: String { get }
    var armor: Float { get }
    var attackPower: Float { get }
    var strength: Float { get }
    var agility: Float { get }
    var intelligence: Float { get }
    var hitPoints: Float { get }
    var mana: Float { get }
    
    var attackStyle: AttackStyle { get }
    var guildStyle: GuildType { get }
    var currentPosition: CGPoint { get set }
    
    typealias Stats = (armor: Float, attackPower: Float, strength: Float, agility: Float, intelligence: Float, hitPoints: Float, mana: Float)
    init(_ stats: Stats)
    mutating func updateCharacteristics(_ stats: Stats)
}

protocol HeroActions: Hero {
    func ultimate()
    func info()
    func attack()
    func stop()
}

extension HeroActions {
    func attack() {
        print(attackStyle.rawValue)
    }
    
    func stop() {
        print("Stop actions")
    }
    
    func info() {
        print("\(self.name)")
    }
}

protocol MovebleHero: HeroActions {
    mutating func move(to point: CGPoint)
}

protocol FlyableHero: HeroActions {
    mutating func fly(to point: CGPoint)
}

extension MovebleHero {
    mutating func move(to point: CGPoint) {
        print("Went from \(currentPosition) to \(point)")
        currentPosition = point
    }
}

extension FlyableHero {
    mutating func fly(to point: CGPoint) {
        print("Flew from \(currentPosition) to \(point)")
        currentPosition = point
    }
}

enum AttackStyle: String {
    case melee = "melee attack!"
    case longRange = "long range attack!"
}

enum GuildType: String {
    case alliance = "Alliance"
    case orc = "Orc"
}

struct Archmage: MovebleHero {
    
    private(set) var armor: Float
    private(set) var attackPower: Float
    private(set) var strength: Float
    private(set) var agility: Float
    private(set) var intelligence: Float
    private(set) var hitPoints: Float
    private(set) var mana: Float
    
    let attackStyle: AttackStyle = .melee
    let guildStyle: GuildType = .alliance
    var currentPosition: CGPoint = CGPoint(x: 0, y: 0)
    let name: String = "Archmage"
    
    init(_ stats: Stats) {
        self.armor = stats.armor
        self.strength = stats.strength
        self.attackPower = stats.attackPower
        self.agility = stats.agility
        self.intelligence = stats.intelligence
        self.hitPoints = stats.hitPoints
        self.mana = stats.mana
    }
    
    mutating func updateCharacteristics(_ stats: Stats) {
        self.armor = stats.armor
        self.attackPower = stats.attackPower
        self.strength = stats.strength
        self.agility = stats.agility
        self.intelligence = stats.intelligence
        self.hitPoints = stats.hitPoints
        self.mana = stats.mana
    }
    
    func ultimate() {
        print("Mass teleport")
    }
}

extension Archmage: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(attackPower)
        hasher.combine(mana)
    }
}

struct Flyer: FlyableHero {
    
    private(set) var armor: Float
    private(set) var attackPower: Float
    private(set) var strength: Float
    private(set) var agility: Float
    private(set) var intelligence: Float
    private(set) var hitPoints: Float
    private(set) var mana: Float
    
    let attackStyle: AttackStyle = .melee
    let guildStyle: GuildType = .alliance
    var currentPosition: CGPoint = CGPoint(x: 0, y: 0)
    let name: String = "Flyer"
    
    init(_ stats: Stats) {
        self.armor = stats.armor
        self.strength = stats.strength
        self.attackPower = stats.attackPower
        self.agility = stats.agility
        self.intelligence = stats.intelligence
        self.hitPoints = stats.hitPoints
        self.mana = stats.mana
    }
    
    mutating func updateCharacteristics(_ stats: Stats) {
        self.armor = stats.armor
        self.attackPower = stats.attackPower
        self.strength = stats.strength
        self.agility = stats.agility
        self.intelligence = stats.intelligence
        self.hitPoints = stats.hitPoints
        self.mana = stats.mana
    }
    
    func ultimate() {
        print("Super attack")
    }
    
}

struct Blademaster: MovebleHero {
    
    private(set) var armor: Float
    private(set) var attackPower: Float
    private(set) var strength: Float
    private(set) var agility: Float
    private(set) var intelligence: Float
    private(set) var hitPoints: Float
    private(set) var mana: Float
    
    let attackStyle: AttackStyle = .melee
    let guildStyle: GuildType = .orc
    var currentPosition: CGPoint = CGPoint(x: 0, y: 0)
    let name: String = "BladeMaster"
    
    init(_ stats: Stats) {
        self.armor = stats.armor
        self.strength = stats.strength
        self.attackPower = stats.attackPower
        self.agility = stats.agility
        self.intelligence = stats.intelligence
        self.hitPoints = stats.hitPoints
        self.mana = stats.mana
    }
    
    mutating func updateCharacteristics(_ stats: Stats) {
        self.armor = stats.armor
        self.attackPower = stats.attackPower
        self.strength = stats.strength
        self.agility = stats.agility
        self.intelligence = stats.intelligence
        self.hitPoints = stats.hitPoints
        self.mana = stats.mana
    }
    
    func ultimate() {
        print("Ultra attack")
    }
    
}

let st = Hero.Stats(armor: 2, attackPower: 2, strength: 2, agility: 2, intelligence: 2, hitPoints: 2, mana: 2)
let st1 = Hero.Stats(armor: 5, attackPower: 5, strength: 5, agility: 5, intelligence: 5, hitPoints: 1, mana: 1)
let st2 = Hero.Stats(armor: 7, attackPower: 7, strength: 5, agility: 5, intelligence: 5, hitPoints: 1, mana: 1)
var arch = Archmage(st)

arch.ultimate()
arch.updateCharacteristics(st1)
arch.move(to: CGPoint(x: 10, y: 5))

var flyer = Flyer(st)
var blademaster = Blademaster(st2)

flyer.fly(to: CGPoint(x: 1, y: 5))
blademaster.attack()

let heroes: [Hero] = [arch, flyer, blademaster]

func getHeroesByGuild(_ heroes: [Hero], filtered: GuildType) -> [Hero] {
    return heroes.filter({ $0.guildStyle == filtered })
}

enum SortCondition {
    case mana
    case attackPower
}

func sortHeroes(_ heroes: [Hero], by param: SortCondition) -> [Hero] {
    switch param {
    case .attackPower:
        return heroes.sorted(by: { $0.attackPower > $1.attackPower })
    case .mana:
        return heroes.sorted(by: { $0.mana > $1.mana })
    }
}

func getMostPowerHero(from heroes: [Hero]) -> Hero? {
    guard let mostPowerHero = sortHeroes(heroes, by: .attackPower).first else { return nil }
    return mostPowerHero
}


let sortedArrayByAttackPower = sortHeroes(heroes, by: .attackPower)
let mostPowerHero = getMostPowerHero(from: heroes)
let filteredArray = getHeroesByGuild(heroes, filtered: .orc)
sortedArrayByAttackPower.forEach { hero in
    print(hero.name, hero.attackPower)
}

filteredArray.forEach { hero in
    print(hero.name, hero.guildStyle.rawValue)
}
print(mostPowerHero?.name, mostPowerHero?.attackPower)

var archmageDict = [Archmage: String]()

archmageDict[arch] = "cool"

