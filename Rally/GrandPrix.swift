class GrandPrix : Rally {
    var length: Int
    var vehicles: Array<Vehicle>
    var raceVehicles: Array<Vehicle>
    final let checkPoint = 10
    
    init(){
        self.length = 10
        self.vehicles = Array<Vehicle>()
        self.raceVehicles = Array<Vehicle>()
    }
    
    //getters
    func getLength() -> Int{
        return length
    }
    func getVehicles() -> Array<Vehicle>{
        return vehicles
    }
    func getRaceVehicles() -> Array<Vehicle>{
        return raceVehicles
    }
    
    //setters
    func setLength(length: Int){
        self.length = length
    }
    func setVehicles(vehicles: Array<Vehicle>){
        self.vehicles = vehicles
    }
    func setRaceVehicles(raceVehicles: Array<Vehicle>){
        self.raceVehicles = raceVehicles
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
        var distanceTravelled: Int = 0
        var finishedVehicles = Array<Vehicle>()
        var winner = Vehicle()
        var count = 1
        
        while(distanceTravelled < length){
            print("------ Checkpoint \(count) -----")
            for vehicle in raceVehicles {
                if vehicle.fuel > 0 {
                    vehicle.travelledDist += vehicle.maxSpeed * 1000 / 60 * Double(checkPoint)
                    vehicle.calculateConsumption(time: checkPoint)
                }                
                print(vehicle.displayRaceDetails())
            }
            distanceTravelled += checkPoint
            count += 1
        }
        
        print("------ Finish -----")
        
        for vehicle in raceVehicles {
            if(vehicle.fuel > 0){
                finishedVehicles.append(vehicle)
                if(vehicle.travelledDist > winner.travelledDist){
                    winner = vehicle
                }
            }
        }
        
        if(finishedVehicles.count > 0){
            for vehicle in finishedVehicles {
                if(vehicle === winner){
                    print("\(vehicle.displayRaceDetails()) won the race")
                }else{
                    print("\(vehicle.displayRaceDetails()) finished the race")
                }
            }
        } else{
            print("All vehicles failed to finish the rally")
        }        
    }
    
    func kmtoMiles(km:Double) -> Double
    {
        return Double(km) * 0.621
    }
    
    func kgtolbs(kg:Int) -> Double
    {
        return Double(kg) * 2.2
    }

    
}


