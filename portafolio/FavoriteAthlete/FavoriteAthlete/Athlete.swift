//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Mariana Almaguer Gonzalez on 22/04/24.
//

import Foundation

struct Athlete{
    let name: String
    let age: String
    let league: String
    let team:String
    
    var description: String{
        return "\(name) is \(age) years old and plays for the \(team) in the \(league)"
    }
}
