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
var fuel: Double?
var category: String?
var sidecar: Bool?
var grandPrix = GrandPrix()

//adding a few default vehicles
var vehiclesList = Array<Vehicle>()
let v1 = Car(name: "Ferrari", maxSpeed: 300, weight: 800, fuel: 45, category: "sports")
v1.performance(maxSpeed: 300, weight: 800)
let v2 = Car(name: "Mustang", maxSpeed: 250, weight: 600, fuel: 50, category: "sports")
v2.performance(maxSpeed: 250, weight: 600)
let v3 = Car(name: "Lamborghini", maxSpeed: 280, weight: 870, fuel: 44, category: "sports")
v3.performance(maxSpeed: 280, weight: 870)
vehiclesList.append(v1)
vehiclesList.append(v2)
vehiclesList.append(v3)
grandPrix.setVehicles(vehicles: vehiclesList)

//display option menu
repeat{
    print("------------------")
    print()
    print("Welcome to Grand Prix")
    print("Select a option to proceed")
    print("1. Choose a car/motorcycle for racing")
    print("2. Add a vehicle to the existing list of Vehicles")
    print("3. Display vehicle list")
    print("4. Exit")
    let opt1:String? = readLine()
    option1 = Int (opt1!)!

    if option1 == 1{
        grandPrix.raceVehicles = vehiclesList
        grandPrix.race(length: 20)
        
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
            fuel = Double(readLine()!)
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
            fuel = Double(readLine()!)
            print("Enter if Motorcyle has sidecar(y/n): ")
            sidecar = Bool(readLine()!)
        }
        else{
            break
        }
        
        //Asdding the vehicle to the vehicle list
        let vehicle = Car(name:name!,maxSpeed: maxSpeed!,weight: weight!,fuel:fuel!,category: category!)
        grandPrix.add(vehicle: vehicle)
        
    }
    else if option1 == 3{
        //display vehicles list 
        for val in grandPrix.getVehicles(){
            if val is Moto {
                (val as! Moto).displayVehicle()
            }
            else{
                (val as! Car).displayVehicle()
            }
        }
    }
    else{
        print("Grand Prix Ended")
        end = 4
    }
    
}while end != 4





//add vehicles in a loop
//select cars to race
