class Vehicle {
    
    //declaring variables
    var name: String
    var maxSpeed: Double
    var weight: Int
    var fuel: Int
    var travelledDist: Double
    
    //default initializer
    init() {
        self.name = "Anonym"
        self.maxSpeed = 130
        self.weight = 1000
        self.fuel = 0
        self.travelledDist = 0
    }
    
    //parameterized initializer
    init(name: String, maxSpeed: Double, weight: Int, fuel: Int) {
        self.name = name
        self.maxSpeed = maxSpeed
        self.weight = weight
        self.fuel = fuel
        self.travelledDist = 0
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
    func getFuel() -> Int{
        return fuel
    }
    func getTravelledDist() -> Double{
        return travelledDist
    }
    
    //setters
    func setName(name: String){
        self.name = name
    }
    func getMaxSpeed(maxSpeed: Double){
        self.maxSpeed = maxSpeed
    }
    func getWeight(weight: Int){
        self.weight = weight
    }
    func getFuel(fuel: Int){
        self.fuel = fuel
    }
    func getTravelledDist(travelledDist: Double){
        self.travelledDist = travelledDist
    }
    
    //function to display the vehicle details
    func displayVehicle(){
        print("\(name) -> \(maxSpeed)km/h, weight = \(weight)kg")
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
    func performance(maxSpeed: Double, weight: Int) -> Double {
        let ratio = maxSpeed / Double(weight)
        //let estimation = "The vehicle performance is: \(ratio)"
        return ratio
    }
}

