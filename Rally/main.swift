//
//  main.swift
//  Test
//
//  Created by MacStudent on 2019-10-18.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation

//declaring variables
var option: String?
var opt1: Int?
var opt2: String?
var name: String?
var maxSpeed: Double?
var weight: Int?
var fuel: Int?
var category: String?

//display option menu
print("Welcome to Grand Prix")
print("Select a option to proceed")
print("1. Choose a car/motorcycle for racing")
print("2. Add a vehicle to the existing list of Vehicles")
opt1 = 1

print("Select Vehicle Type")
print("a. Car")
print("b. Motorcycle")

opt2 = "a"
print("Enter Vehicle Name: ")
print("Enter Vehicle Maximum Speed: ")
let input:String?
input = readLine()
let int = Double(input!)!

print("Enter Vehicle Weight: ")
print("Enter Vehicle Fuel: ")
print("Enter Vehicle Category: ")

//let vehicle = Car(name:name!,maxSpeed: int!,weight: weight!,fuel:fuel!,category: category!)
//let vehicleList = GrandPrix()
//
//vehicleList.add(vehicle: vehicle)

//add vehicles in a loop
//select cars to race
