class GrandPrix : Rally {
    var length: Int
    var vehicles: Array<Vehicle>
    var raceVehicles: Array<Vehicle>
    final let checkPoint = 5
    
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
    
    // function to find vehicles by name
    func findByCarName(name: String) -> Bool{
        if(vehicles.contains(where: {$0.name == name})){
            return true
        }
        return false
    }
    
    // function to add vehicles to the race
    func addToRace(vehicle: Vehicle) {
        if(!raceVehicles.contains(where: {$0.name == vehicle.name})){
            raceVehicles.append(vehicle)
        }else{
            print("\nVehicle is not in the list")
        }        
        print("\n4\(vehicle.name) added successfully to the race")
    }
    
    // function to add random vehicles to the race
    func addRandomVehicles() {
        let num = Int.random(in: 2 ... vehicles.count)
        var count = 0
        raceVehicles = Array<Vehicle>()
        
        while(count < num){
            let vehicle = vehicles.randomElement()!
            if(!raceVehicles.contains(where: {$0.name == vehicle.name})){
                raceVehicles.append(vehicle)
                count += 1
            }
        }
        print("\nRandom vehicles added to the race")
    }
    
    // function to reset the values for a new race
    func resetRace(){
        raceVehicles = Array<Vehicle>()
        
        for vehicle in vehicles{
            vehicle.fuelConsumed = 0
            vehicle.travelledDist = 0
        }
    }
    
    // function to check if the vehicles can race together
    func check() -> Bool {
        var twoWheeled: Bool = false
        for (index, vehicle) in raceVehicles.enumerated(){
            if index == 0{
                if vehicle is Car || !(vehicle as! Moto).isTwoWheeled(){
                    twoWheeled = false
                }else{
                    twoWheeled = true
                }
            }else{
                if (vehicle is Car || !(vehicle as! Moto).isTwoWheeled()) && twoWheeled {
                    return false
                }else if vehicle is Moto && (vehicle as! Moto).isTwoWheeled() && !twoWheeled{
                    return false
                }
            }
        }
        return true
    }
    
    // function that makes the vehicles race together. The length of the race is in minutes and each loop of the function represents how many minutes passed in the race using the variable checkpoint
    func race(length:Int) {
        var distanceTravelled: Int = 0
        var finishedVehicles = Array<Vehicle>()
        var winner = Vehicle()
        var count = 1
        var nextCheckPoint: Int = 0
        
        print("\n------------- Race Starts --------------")
        
        while(distanceTravelled < length){
            if(checkPoint * count > length){
                nextCheckPoint = checkPoint * count - length
            }else{
                nextCheckPoint = checkPoint
            }
            print("\n------ Checkpoint \(count) -----\(nextCheckPoint)")
            for vehicle in raceVehicles {
                if vehicle.fuel - vehicle.fuelConsumed > 0 {
                    vehicle.travelledDist += vehicle.maxSpeed * 1000 / 60 * Double(nextCheckPoint)
                    vehicle.calculateConsumption(time: nextCheckPoint)
                }                
                print(vehicle.displayRaceDetails())
            }
            distanceTravelled += checkPoint
            count += 1
        }
        
        print("\n------ Results ------")
        
        for vehicle in raceVehicles {
            if(vehicle.fuel - vehicle.fuelConsumed > 0){
                finishedVehicles.append(vehicle)
                if(vehicle.travelledDist > winner.travelledDist){
                    winner = vehicle
                }
            }
        }
        
        if(finishedVehicles.count > 0){
            for vehicle in finishedVehicles {
                if(vehicle === winner){
                    print("\(vehicle.displayRaceDetails()) | won the race")
                }else{
                    print("\(vehicle.displayRaceDetails()) | finished the race")
                }
            }
        } else{
            print("\nAll vehicles failed to finish the rally")
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
    
    //display vehicles list
    func displayVehicles(){
        print("\n------ Vehicles available to race ------")
        for item in vehicles{
            if item is Moto {
                print((item as! Moto).displayVehicle())
            }
            else{
                print((item as! Car).displayVehicle())
            }
        }
    }
    
    //display race vehicles list
    func displayRaceVehicles(){
        print("\n------ Vehicles in the race ------")
        for item in raceVehicles{
            if item is Moto {
                print("-> \((item as! Moto).displayVehicle())")
            }
            else{
                print("-> \((item as! Car).displayVehicle())")
            }
        }
    }

    //display vehicles list that are not in the race
    func displayAvailableVehicles(){
        for (index,item) in vehicles.enumerated(){
            if(!raceVehicles.contains(where: {$0.name == item.name})){
                if item is Moto {
                    print("-> \(index+1) -> \((item as! Moto).displayVehicle())")
                }
                else{
                    print("-> \(index+1) -> \((item as! Car).displayVehicle())")
                }
            }
        }
    }
    
    //function to check if this instance has better performance than the other vehicle
    func betterPerformance(list: Array<Vehicle>){
        if(list.count > 0){
            var better = Vehicle()
            for (index,vehicle) in list.enumerated() {
                if index == 0{
                    better = vehicle
                }else{
                    if(better.horsePower < vehicle.horsePower){
                        better = vehicle
                    }
                }
            }
            
            print("\nThe vehicle below has the best perfomance:")
            print("-> \(better.displayVehicle())")
        }else{
            print("\nThere is no vehicles in the race")
        }
    }
}


