//
//  IcecreamTests.swift
//  IcecreamTests
//
//  Created by James Campagno on 9/19/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import XCTest
@testable import Icecream

class IcecreamTests: XCTestCase {
    
    let testIcecream = Icecream()
    
    let namesAndFlavors = [
        "Joe" : "Peanut Butter and Chocolate",
        "Tim" : "Natural Vanilla",
        "Sophie" : "Mexican Chocolate",
        "Deniz" : "Natural Vanilla",
        "Tom" : "Mexican Chocolate",
        "Jim" : "Natural Vanilla",
        "Susan" : "Cookies 'N' Cream"
    ]
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    // 1.
    func testStoredProperty() {
        XCTAssertEqual(testIcecream.favoriteFlavorsOfIceCream, namesAndFlavors, "Ice-cream dictionary is not created with the right key-value pairs.")
    }
    
    
    // 2.
    func testNamesForFlavorNaturalVanilla() {
        let vanillaNames = testIcecream.names(forFlavor: "Natural Vanilla")
        let expectedVanillaNames = ["Deniz", "Jim", "Tim"]
        XCTAssertEqual(vanillaNames.sorted(), expectedVanillaNames, "Deniz, Jim and Tim are the only ones that like Vanilla!")
    }
    
    func testNamesForFlavorPeanutButterAndChocolate() {
        let pbAndCnames = testIcecream.names(forFlavor: "Peanut Butter and Chocolate")
        let pbAndCExpectedNames = ["Joe"]
        XCTAssertEqual(pbAndCnames.sorted(), pbAndCExpectedNames, "Only Joe likes Peanut Butter and Chocolate")
    }
    
    func testNamesForFlavorMexicanChocolate() {
        let mexicanChocNames = testIcecream.names(forFlavor: "Mexican Chocolate")
        let expectedMexicanChocNames = ["Sophie", "Tom"]
        XCTAssertEqual(mexicanChocNames.sorted(), expectedMexicanChocNames, "Only Sophie and Tom like Mexican Chocolate")
    }
    
    func testNamesForNonExistentFlavor() {
        let blackberryNames = testIcecream.names(forFlavor: "Blackberry")
        let expectedBlackberryNames: [String] = []
        XCTAssertEqual(blackberryNames, expectedBlackberryNames, "No one likes blackberry, it should return an empty array.")
    }
    
    
    // 3.
    func testCountForNaturalVanilla() {
        let actualCount = testIcecream.count(forFlavor: "Natural Vanilla")
        XCTAssertEqual(actualCount, 3, "Only 3 people like Natural Vanilla.")
    }
    
    func testCountForMexicanChocolate() {
        let actualCount = testIcecream.count(forFlavor: "Mexican Chocolate")
        XCTAssertEqual(actualCount, 2, "Only 2 people like Natural Vanilla.")
    }
    
    func testCountForNonExistentFlavor() {
        let actualCount = testIcecream.count(forFlavor: "Blackberry")
        XCTAssertEqual(actualCount, 0, "0 people like Blackberry.")
    }
    
    func testCountForPeanutButterandChocolate() {
        let actualCount = testIcecream.count(forFlavor: "Peanut Butter and Chocolate")
        XCTAssertEqual(actualCount, 1, "Only 1 person likes Peanut Butter and Chocolate.")
    }
    
    
    // 4.
    func testFlavorForJoe() {
        let flavor = testIcecream.flavor(forPerson: "Joe")
        XCTAssertNotNil(flavor, "Joe has a favorite flavor, it should not return nil.")
        XCTAssertEqual(flavor, "Peanut Butter and Chocolate", "Joes favorite flavor is Peanut Butter and Chocolate")
    }
    
    func testFlavorForNonExistentFlavor() {
        let flavor = testIcecream.flavor(forPerson: "Bran Stark")
        XCTAssertNil(flavor, "Bran doesn't have a favorite flavor, this should return nil.")
    }
    
    
    // 5.
    func testReplaceFlavorForJoe() {
        let flavorIsChanged = testIcecream.replace(flavor: "Berry", forPerson: "Joe")
        XCTAssertTrue(flavorIsChanged, "This should have returned true, Joe's flavor should also have been updated.")
        
        let flavor = testIcecream.flavor(forPerson: "Joe")
        XCTAssertEqual(flavor, "Berry", "Joes favorite flavor should now be Berry")
    }
    
    func testReplaceFlavorForNonExistentPerson() {
        let flavorIsChanged = testIcecream.replace(flavor: "Strawberry", forPerson: "Jon Snow")
        XCTAssertFalse(flavorIsChanged, "This should have returned false, Jon Snow doesn't exist.")
        
        let flavor = testIcecream.flavor(forPerson: "Jon Snow")
        XCTAssertNil(flavor, "We should have just returned false, not add Jon Snow to the dictionary.")
    }
    
    
    // 6.
    func testRemovePersonForJoe() {
        XCTAssertTrue(testIcecream.remove(forPerson: "Joe"), "Joe should be removed from the dictionary and it should return true.")
        XCTAssertFalse(testIcecream.remove(forPerson: "Joe"), "Joe should have already been removed at this point, it should then return false.")
    }
    
    func testRemoveForNonExistentPerson() {
        XCTAssertFalse(testIcecream.remove(forPerson: "Jon Snow"), "Jon Snow doesn't exist in the dictionary, it should return false.")
    }
    
    
    // 7.
    func testNumberOfAttendees() {
        XCTAssertTrue(testIcecream.numberOfAttendees() == 7, "There are 7 attendees.")
    }
    
    func testNumberOfAttendeesAfterRemovingOne() {
        _ = testIcecream.remove(forPerson: "Joe")
        XCTAssertTrue(testIcecream.numberOfAttendees() == 6, "After removing Joe there should only be 6 attendees.")
    }
    
    
    // 8.
    func testAddPersonWithTravis() {
        let isAddedToParty = testIcecream.addPerson(person: "Travis", withFlavor: "Strawberry")
        XCTAssertTrue(isAddedToParty, "Travis is new to the party, the function should return true.")
        
        let flavor = testIcecream.flavor(forPerson: "Travis")
        XCTAssertNotNil(flavor, "Travis has been added to the dictionary, we should be able to retrieve his flavor.")
    }

    
    // 9.
    func testAttendeeList() {
        let expectedList = "Deniz likes Natural Vanilla\nJim likes Natural Vanilla\nJoe likes Peanut Butter and Chocolate\nSophie likes Mexican Chocolate\nSusan likes Cookies 'N' Cream\nTim likes Natural Vanilla\nTom likes Mexican Chocolate"
        
        let list = testIcecream.attendeesList()
        
        XCTAssertEqual(list, expectedList, "Your list is not correct. Make sure that you're not adding a new line after the last person")
    }

}
