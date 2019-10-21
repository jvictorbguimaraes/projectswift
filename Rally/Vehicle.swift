class Vehicle {
    var name: String
    var maxSpeed: Double
    var weight: Int
    var fuel: Int
    
    //default initializer
    init() {
        self.name = "Anonym"
        self.maxSpeed = 130
        self.weight = 1000
        self.fuel = 0
    }
    
    //parameterized initializer
    init(name: String, maxSpeed: Double, weight: Int, fuel: Int) {
        self.name = name
        self.maxSpeed = maxSpeed
        self.weight = weight
        self.fuel = fuel
    }
    
    //getters
    func getName() -> String{
        return name
    }
    
    //function to display the vehicle details
    func displayVehicle(){
        print("\(name) -> \(maxSpeed)km/h, weight = \(weight)kg")
    }
    
    //function to check if this instance has better performance than the other vehicle
    func better(){
        
    }
    
    //tool to check performance of the car
    func performance(maxSpeed: Double, weight: Int) -> Double {
        let ratio = maxSpeed / Double(weight)
        //let estimation = "The vehicle performance is: \(ratio)"
        return ratio
    }
}

