//
//  Model.swift
//  EditingTableVIew
//
//  Created by Oleg Stepanov on 21.03.2022.
//

import Foundation

struct League {
    var name: String
    var teams: [Team]
}

struct Team {
    var name: String
    var points: Int
}

extension League {
    static var leagues: [League] = [League(name: "RPL", teams: [Team(name: "Spartak", points: 10),
                                                                Team(name: "CSKA", points: 21),
                                                                Team(name: "Lokomotiv", points: 15),
                                                                Team(name: "Zenit", points: 15)]),
                                    League(name: "APL", teams: [Team(name: "Liverpool", points: 44),
                                                                Team(name: "Chelsea", points: 22),
                                                                Team(name: "Manchester United", points: 33),
                                                                Team(name: "Manchester City", points: 35)]),
                                    League(name: "Bundesliga", teams: [Team(name: "Bayern", points: 33),
                                                                       Team(name: "Borussia", points: 35),
                                                                       Team(name: "Leipzig", points: 34),
                                                                       Team(name: "Volwsburg", points: 22)]),
                                    League(name: "Premera", teams: [Team(name: "Real madrid", points: 50),
                                                                    Team(name: "Barcelona", points: 20),
                                                                    Team(name: "Atletic", points: 30),
                                                                    Team(name: "Vellireal", points: 20)])]
}
