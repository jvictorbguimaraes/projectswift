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
let v1 = Car(name: "Ferrari", maxSpeed: 300, weight: 800, fuel: 45, category: "Race Car")
v1.performance(maxSpeed: 300, weight: 800)
let v2 = Car(name: "Mustang", maxSpeed: 250, weight: 600, fuel: 50, category: "Touring Car")
v2.performance(maxSpeed: 250, weight: 600)
let v3 = Car(name: "Lamborghini", maxSpeed: 280, weight: 870, fuel: 44, category: "Race Car")
v3.performance(maxSpeed: 280, weight: 870)
let v4 = Moto(name: "Kawasaki", maxSpeed: 320, weight: 320, fuel: 67, sidecar: false)
v4.performance(maxSpeed: 320, weight: 320)
let v5 = Moto(name: "Yamaha", maxSpeed: 230, weight: 450, fuel: 87, sidecar: true)
v5.performance(maxSpeed: 230, weight: 450)
let v6 = Moto(name: "Honda", maxSpeed: 300, weight: 280, fuel: 77, sidecar: false)
v6.performance(maxSpeed: 300, weight: 280)

vehiclesList.append(v1)
vehiclesList.append(v2)
vehiclesList.append(v3)
vehiclesList.append(v4)
vehiclesList.append(v5)
vehiclesList.append(v6)
grandPrix.setVehicles(vehicles: vehiclesList)

print("Welcome to Grand Prix")

//display option menu
raceLoop: while(true){
    print("------------------")
    print("Select a option to proceed or any other value to exit")
    print("1. Create a new vehicle")
    print("2. Display available vehicle list")
    print("3. Display vehicles in the race")
    print("4. Add a car/motorcycle to the race")
    print("5. Start race")
    print("6. Compare two available vehicles")
    let opt1:String? = readLine()
    option1 = Int (opt1!)!
    let vehicle: Vehicle
    
    switch(option1){
        case 1:
            print("Select Vehicle Type")
            print("1. Car")
            print("2. Motorcycle")
            
            let opt2:String? = readLine()
            option2 = Int(opt2!)!
            
            switchOption2: switch(option2){
            case 1:
                print("Enter Vehicle Name: ")
                name = readLine()
                print("Enter Vehicle Maximum Speed: ")
                maxSpeed = Double(readLine()!)
                print("Enter Vehicle Weight: ")
                weight = Int(readLine()!)
                print("Enter Vehicle Fuel Level: ")
                fuel = Double(readLine()!)
                var chosenCategory = 0
                while(chosenCategory != 1 && chosenCategory != 2){
                    print("Enter Car Category: \n1: Race Car \n2: Touring Car")
                    chosenCategory = Int(readLine()!)!
                }
                if(chosenCategory == 1){
                    category = "Race Car"
                }else{
                    category = "Touring Car"
                }
                vehicle = Car(name:name!,maxSpeed: maxSpeed!,weight: weight!,fuel:fuel!,category: category!)
            case 2:
                print("Enter Vehicle Name: ")
                name = readLine()
                print("Enter Vehicle Maximum Speed: ")
                maxSpeed = Double(readLine()!)
                print("Enter Vehicle Weight: ")
                weight = Int(readLine()!)
                print("Enter Vehicle Fuel Level: ")
                fuel = Double(readLine()!)
                print("Enter if Motorcyle has sidecar(true/false): ")
                sidecar = Bool(readLine()!)
                vehicle = Moto(name:name!,maxSpeed: maxSpeed!,weight: weight!,fuel:fuel!,sidecar: sidecar!)
            default:
                print("Wrong choice")
                continue raceLoop
            }
            
            //Adding the vehicle to the vehicle list
            grandPrix.add(vehicle: vehicle)
        
        case 2:
            grandPrix.displayVehicles()
        case 3:
            grandPrix.displayRaceVehicles()
        case 4:
            print("Choose the vehicle to add to the race")
            grandPrix.displayAvailableVehicles()
            let vehicleChosen = Int(readLine()!)!
            if(vehicleChosen > grandPrix.vehicles.count || vehicleChosen < 0){
                print("Wrong vehicle number")
            }else{
                grandPrix.addToRace(vehicle: (grandPrix.vehicles[vehicleChosen-1]))
            }
        case 4:
            //check performance
            break
        case 5:
            if grandPrix.raceVehicles.count < 2{
                print("Need at least 2 vehicles in the race")
                break
            }
            else if(!grandPrix.check()){
                print("Not a GrandPrix")
                break
            }
            
            print("Choose the length of the race in minutes")
            let length = Int(readLine()!)!
            grandPrix.race(length: length)
            grandPrix.newRace()
        case 6:
            print("Enter first vehicle name")
            let n1 = readLine()
            print("Enter second vehicle name")
            let n2 = readLine()
            var v1 = Vehicle()
            var v2 = Vehicle()
            let vehicles = grandPrix.getVehicles()
            for item in vehicles{
                if item.getName() == n1 {
                    v1 = Vehicle(name: item.name, maxSpeed: item.getMaxSpeed(), weight: item.getWeight(), fuel: item.getFuel())
                }
                else if item.getName() == n2{
                    v2 = Vehicle(name: item.name, maxSpeed: item.getMaxSpeed(), weight: item.getWeight(), fuel: item.getFuel())
                }
            }
            let betterVehicle = grandPrix.better(v1: v1, v2: v2)
            print("The better vehicle is : \(betterVehicle.name)")
            
                break
        default:
            break raceLoop
    }
}
