import Foundation

class Vehicle {
    
    //declaring variables
    var name: String
    var maxSpeed: Double
    var weight: Int
    var fuel: Double
    var travelledDist: Double
    var horsePower: Double
    var fuelConsumed: Double
    
    //default initializer
    init() {
        self.name = "Anonym"
        self.maxSpeed = 130
        self.weight = 1000
        self.fuel = 0
        self.travelledDist = 0
        self.horsePower = 0
        self.fuelConsumed = 0
    }
    
    //parameterized initializer
    init(name: String, maxSpeed: Double, weight: Int, fuel: Double) {
        self.name = name
        self.maxSpeed = maxSpeed
        self.weight = weight
        self.fuel = fuel
        self.travelledDist = 0
        self.horsePower = 0
        self.fuelConsumed = 0
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
        return ("\(name) -> Max Speed: \(maxSpeed)km/h, Weight: \(weight)kg, Fuel: \(fuel)")
    }
    
    func displayRaceDetails() -> String{
        return ("\(name) -> Distance Travelled: \((travelledDist/1000).rounded()) km, Fuel Left: \((round((fuel - fuelConsumed)*100)/100)) l")
    }
    
    //tool to check performance of the car
    func performance() {
        let f = GrandPrix()        
        let w = f.kgtolbs(kg: weight)
        let s = f.kmtoMiles(km: maxSpeed)
        horsePower = w * pow((s / 234),3.0)
    }
    
    //A vehicle consumes about 0.15 pounds of fuel per hour for each unit of horsepower. And the funtion returns the strength thats is based on the fuel left in the car, if it has less fuel then he would use for the checkpoint hes gonna travel less kilometers before ran out of fuel
    func calculateConsumption(time: Int) -> Double {
        let consumption = ((horsePower * 0.15) / 2.2) * Double(time) / 60
        var strength : Double = 0;
        if fuel - fuelConsumed - consumption < 0 {
            strength = ((fuel - fuelConsumed) * 100) / consumption / 100
            fuelConsumed = fuel
        }else {
            fuelConsumed += consumption
            strength = 1
        }
        return strength
    }
}

