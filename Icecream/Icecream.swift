//
//  Icecream.swift
//  Icecream
//
//  Created by James Campagno on 9/19/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Icecream {
    
    var favoriteFlavorsOfIceCream = ["Joe": "Peanut Butter and Chocolate",
                                     "Tim": "Natural Vanilla", "Sophie": "Mexican Chocolate", "Deniz": "Natural Vanilla", "Tom": "Mexican Chocolate", "Jim": "Natural Vanilla", "Susan": "Cookies 'N' Cream"]
    
    
    
    func names (forFlavor flavor: String) -> [String] {
        var flavorLikers: [String] = []
        for namesOfPeople in favoriteFlavorsOfIceCream.keys {
            if favoriteFlavorsOfIceCream[namesOfPeople] == flavor {
                flavorLikers.append(namesOfPeople)
            }
        }
        return flavorLikers
    }
    
    func count(forFlavor flavor: String) -> Int {
        var flavorCount: [String] = []
        let allFlavors = Array(favoriteFlavorsOfIceCream.values)
        for availableFlavor in allFlavors {
            if availableFlavor == flavor {
                flavorCount.append(availableFlavor)
          }
        }
        return flavorCount.count
    }
    
    func flavor(forPerson person: String) -> String? {
        if Array(favoriteFlavorsOfIceCream.keys).contains(person) {
            return favoriteFlavorsOfIceCream[person]
        } else {
            return nil
        }
    }
    
    func replace(flavor: String, forPerson: String) -> Bool {
        let arrayOfNames = Array(favoriteFlavorsOfIceCream.keys)
        if arrayOfNames.contains(forPerson) {
            favoriteFlavorsOfIceCream.updateValue(flavor, forKey: forPerson)
            return true
        } else {
            return false
        }
    }
    
    func remove(forPerson: String) -> Bool {
        let arrayOfNames = Array(favoriteFlavorsOfIceCream.keys)
        if arrayOfNames.contains(forPerson) {
            favoriteFlavorsOfIceCream[forPerson] = nil
            return true
        } else {
            return false
        }
    }
   
    func numberOfAttendees () -> Int {
        let attendeesList = Array(favoriteFlavorsOfIceCream.keys)
        return attendeesList.count
    }
    
    func addPerson (person: String, withFlavor: String) -> Bool {
        let attendeesList = Array(favoriteFlavorsOfIceCream.keys)
        if attendeesList.contains(person) {
            return false
        } else {
            favoriteFlavorsOfIceCream[person] = withFlavor
            return true
        }
    }
    
    func attendeesList () -> String {
        let allNames = Array(favoriteFlavorsOfIceCream.keys).sorted()
        var sentence: String = ""
        for (index, name) in allNames.enumerated() {
            if let flavor = favoriteFlavorsOfIceCream[name] {
                if allNames.count == index+1 {
                    sentence += "\(name) likes \(flavor)"
                } else {
                    sentence += "\(name) likes \(flavor)\n"
                }
            }
        }
        return sentence
    }
}
