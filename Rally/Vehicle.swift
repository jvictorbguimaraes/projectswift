import Foundation

class Vehicle {
    
    //declaring variables
    var name: String
    var maxSpeed: Double
    var weight: Int
    var fuel: Double
    var travelledDist: Double
    var horsePower: Double
    
    //default initializer
    init() {
        self.name = "Anonym"
        self.maxSpeed = 130
        self.weight = 1000
        self.fuel = 0
        self.travelledDist = 0
        self.horsePower = 0
    }
    
    //parameterized initializer
    init(name: String, maxSpeed: Double, weight: Int, fuel: Double) {
        self.name = name
        self.maxSpeed = maxSpeed
        self.weight = weight
        self.fuel = fuel
        self.travelledDist = 0
        self.horsePower = 0
    }
    
    //getters
    func getName() -> String{
        return name
    }
    func getMaxSpeed() -> Double{
        return maxSpeed
    }
    func getWeight() -> Int{
        return weight
    }
    func getFuel() -> Double{
        return fuel
    }
    func getTravelledDist() -> Double{
        return travelledDist
    }
    
    //setters
    func setName(name: String){
        self.name = name
    }
    func setMaxSpeed(maxSpeed: Double){
        self.maxSpeed = maxSpeed
    }
    func setWeight(weight: Int){
        self.weight = weight
    }
    func setFuel(fuel: Double){
        self.fuel = fuel
    }
    func setTravelledDist(travelledDist: Double){
        self.travelledDist = travelledDist
    }
    
    func displayVehicle() -> String{
        return ("\(name), Max Speed: \(maxSpeed)km/h, Weight: \(weight)kg")
    }
    
    func displayRaceDetails() -> String{
        return ("\(name) -> Distance Travelled: \((travelledDist/1000).rounded())km, Fuel Left: \(fuel.rounded())l")
    }
    
    //function to check if this instance has better performance than the other vehicle
    func better() -> Bool{
        let pef: Bool?
        pef = true
        if(pef! == true){
            return true
        }
        else{
            return false
        }
    }
    
    //tool to check performance of the car
    func performance(maxSpeed: Double, weight: Int) {
        //let ratio = maxSpeed / Double(weight)
        //let estimation = "The vehicle performance is: \(ratio)"
        
        let f = GrandPrix()
        
        let w = f.kgtolbs(kg: weight)
        let s = f.kmtoMiles(km: maxSpeed)
        horsePower = w * pow((s / 234),3.0)
    }
    
    //On average, a vehicle about 0.4 pounds of fuel per hour for each unit of horsepower.
    func calculateConsumption(time: Int) {
        let consumption = fuel - ((horsePower * 0.4) / 2.2) * 0.16
        
        if consumption < 0 {
            fuel = 0
        }else {
            fuel = consumption
        }
    }
}

