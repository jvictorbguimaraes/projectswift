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
let v1 = Car(name: "Ferrari", maxSpeed: 300, weight: 800, fuel: 70, category: "Race Car")
v1.performance()
let v2 = Car(name: "Mustang", maxSpeed: 250, weight: 600, fuel: 67, category: "Touring Car")
v2.performance()
let v3 = Car(name: "Lamborghini", maxSpeed: 280, weight: 870, fuel: 72, category: "Race Car")
v3.performance()
let v4 = Moto(name: "Kawasaki", maxSpeed: 320, weight: 320, fuel: 67, sidecar: false)
v4.performance()
let v5 = Moto(name: "Yamaha", maxSpeed: 230, weight: 450, fuel: 87, sidecar: true)
v5.performance()
let v6 = Moto(name: "Honda", maxSpeed: 300, weight: 280, fuel: 77, sidecar: false)
v6.performance()

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
    print("\n-----------------------------------------------------")
    print("Select a option to proceed or any other value to exit")
    print("1. Create a new vehicle")
    print("2. Display all vehicles")
    print("3. Display vehicles in the race")
    print("4. Add a car/motorcycle to the race")
    print("5. Add random vehicles to the race")
    print("6. Get the vehicle in the race who has the better performance")
    print("7. Start race")
    print("8. Reset race")
    
    let opt1:String? = readLine()
    option1 = Int (opt1!)!
    let vehicle: Vehicle
    
    switch(option1){
        case 1:
            print("\nSelect Vehicle Type")
            print("1. Car")
            print("2. Motorcycle")
            
            let opt2:String? = readLine()
            option2 = Int(opt2!)!
            
            switchOption2: switch(option2){
            case 1:
                insertName: while(true){
                    print("\nEnter Vehicle Name: ")
                    name = readLine()!
                    if(!grandPrix.findByCarName(name: name!)){
                        break insertName
                    }
                    print("\nVehicles can't have the same name, type a different one")
                }
                print("\nEnter Vehicle Maximum Speed (km/h): ")
                maxSpeed = Double(readLine()!)
                print("\nEnter Vehicle Weight (kg): ")
                weight = Int(readLine()!)
                print("\nEnter Vehicle Fuel Level (litres): ")
                fuel = Double(readLine()!)
                var chosenCategory = 0
                while(chosenCategory != 1 && chosenCategory != 2){
                    print("\nEnter Car Category: \n1: Race Car \n2: Touring Car")
                    chosenCategory = Int(readLine()!)!
                }
                if(chosenCategory == 1){
                    category = "Race Car"
                }else{
                    category = "Touring Car"
                }
                vehicle = Car(name:name!,maxSpeed: maxSpeed!,weight: weight!,fuel:fuel!,category: category!)
            case 2:
                print("\nEnter Vehicle Name: ")
                name = readLine()
                print("\nEnter Vehicle Maximum Speed (km/h): ")
                maxSpeed = Double(readLine()!)
                print("\nEnter Vehicle Weight (kg): ")
                weight = Int(readLine()!)
                print("\nEnter Vehicle Fuel Level (litres): ")
                fuel = Double(readLine()!)
                print("\nEnter if Motorcyle has sidecar(true/false): ")
                sidecar = Bool(readLine()!)
                vehicle = Moto(name:name!,maxSpeed: maxSpeed!,weight: weight!,fuel:fuel!,sidecar: sidecar!)
            default:
                print("\nWrong choice")
                continue raceLoop
            }
            
            // calculating vehicle performance
            vehicle.performance()
            
            //Adding the vehicle to the vehicle list
            grandPrix.add(vehicle: vehicle)
            print("\nVehicle added successfully to the list of vehicles")
        
        case 2:
                grandPrix.displayVehicles()            
        case 3:
            if grandPrix.raceVehicles.count == 0{
                print("\nNo vehicle in the race")
            }
            else{
                grandPrix.displayRaceVehicles()
            }
        case 4:
            print("\nChoose the vehicle to add to the race using its number")
            grandPrix.displayAvailableVehicles()
            let vehicleChosen = Int(readLine()!)!
            grandPrix.addToRace(vehicle: (grandPrix.vehicles[vehicleChosen-1]))
        case 5:
            grandPrix.addRandomVehicles()
        case 6:
            grandPrix.betterPerformance(list: grandPrix.getRaceVehicles())
        case 7:
            if grandPrix.raceVehicles.count < 2{
                print("\nNeed at least 2 vehicles in the race")
                break
            }
            else if(!grandPrix.check()){
                print("\nNot a GrandPrix")
                break
            }
            
            print("\nChoose the length of the race in kilometers (km)")
            let length = Int(readLine()!)!
            grandPrix.setLength(length: length * 1000)
            grandPrix.race()
            grandPrix.resetRace()
        case 8:
            grandPrix.resetRace()
        default:
            break raceLoop
    }
}

