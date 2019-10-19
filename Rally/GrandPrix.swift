class GrandPrix : Rally {
    var length: Int
    var vehicles: Array<Vehicle>
    
    init(length: Int){
        self.length = length
        vehicles = Array<Vehicle>()
    }
    
    func add(vehicle: Vehicle) {
        vehicles.append(vehicle)
    }
    
    //func newRace(raceLength: Int){
    //    init(length: raceLength)
    //}
    
    override func check() -> Bool {
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
}


