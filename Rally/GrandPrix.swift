class GrandPrix : Rally {
    var length: Int
    var vehicles: Array<Vehicle>
    var raceVehicles: Array<Vehicle>
    final let turnValue = 10
    
    init(length: Int){
        self.length = length
        vehicles = Array<Vehicle>()
        raceVehicles = Array<Vehicle>()
    }
    
    // function to add the vehicles in the race
    func add(vehicle: Vehicle) {
        vehicles.append(vehicle)
    }
    
    // function to reset the values for a new race
    func newRace(raceLength: Int){
        vehicles.append(contentsOf: raceVehicles)
        raceVehicles = Array<Vehicle>()
    }
    
    // function to check if the vehicles can race together
    func check() -> Bool {
        var twoWheeled: Bool = false
        for (index, vehicle) in vehicles.enumerated(){
            if index == 0{
                if vehicle is Car || (vehicle as! Moto).isTwoWheeled(){
                    twoWheeled = true
                }else{
                    twoWheeled = false
                }
            }else{
                if (vehicle is Car || !(vehicle as! Moto).isTwoWheeled()) && twoWheeled {
                    return false
                }else if (vehicle as! Moto).isTwoWheeled() && !twoWheeled{
                    return false
                }
            }
        }
        return true
    }
    
    // function that makes the vehicles race together. The length of the are is in minutes and each loop of the function represents how many minutes passed in the race using the variable turnValue
    func race(length:Int) {
        var turns: Int = 0
        var finishedVehicles = Array<Vehicle>()
        var winner = Vehicle();
        
        while(turns < length){
            for vehicle in raceVehicles {
                vehicle.travelledDist = vehicle.maxSpeed * 1000 / 60 * Double(turnValue)
                vehicle.fuel -= vehicle.fuel //add fuel consumption
            }
            turns += turnValue
        }
        
        for vehicle in raceVehicles {
            if(vehicle.fuel > 0){
                finishedVehicles.append(vehicle)
                if(vehicle.travelledDist > winner.travelledDist){
                    winner = vehicle
                }
            }
        }
        
        for vehicle in finishedVehicles {
            if(vehicle === winner){
                print("\(vehicle.displayVehicle()) won the race")
            }else{
                print("\(vehicle.displayVehicle()) finished the race")
            }
        }
    }
}


