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
var option1: Int?
var option2: Int?
var end = 0

var name: String?
var maxSpeed: Double?
var weight: Int?
var fuel: Int?
var category: String?
var sidecar: Bool?
var grandPrix = GrandPrix()

//display option menu
repeat{
    print("Welcome to Grand Prix")
    print("Select a option to proceed")
    print("1. Choose a car/motorcycle for racing")
    print("2. Add a vehicle to the existing list of Vehicles")
    print("3. Exit")
    let opt1:String? = readLine()
    option1 = Int (opt1!)!

    if option1 == 1{
        
    }
    else if option1 == 2{
        print("Select Vehicle Type")
        print("1. Car")
        print("2. Motorcycle")
        print("3. Exit")
        let opt2:String? = readLine()
        option2 = Int(opt2!)!

        if option2 == 1{
            print("Enter Vehicle Name: ")
            name = readLine()
            print("Enter Vehicle Maximum Speed: ")
            maxSpeed = Double(readLine()!)
            print("Enter Vehicle Weight: ")
            weight = Int(readLine()!)
            print("Enter Vehicle Fuel Level: ")
            fuel = Int(readLine()!)
            print("Enter Car Category: ")
            category = readLine()
        }
        else if option2 == 2{
            print("Enter Vehicle Name: ")
            name = readLine()
            print("Enter Vehicle Maximum Speed: ")
            maxSpeed = Double(readLine()!)
            print("Enter Vehicle Weight: ")
            weight = Int(readLine()!)
            print("Enter Vehicle Fuel Level: ")
            fuel = Int(readLine()!)
            print("Enter if Motorcyle has sidecar(y/n): ")
            sidecar = Bool(readLine()!)
        }
        else{
            break
        }
        
        //Asdding the vehicle to the vehicle list
        let vehicle = Car(name:name!,maxSpeed: maxSpeed!,weight: weight!,fuel:fuel!,category: category!)
        grandPrix.add(vehicle: vehicle)
        for val in grandPrix.getVehicles(){
            print(val.displayVehicle())
        }
    }
    else{
        print("Grand Prix Ended")
        end = 3
    }
    
}while end != 3




//add vehicles in a loop
//select cars to race
