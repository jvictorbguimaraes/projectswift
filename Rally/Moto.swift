class Moto : Vehicle{
    var sidecar: Bool
    
    override init(){
        self.sidecar = false
        super.init()
    }
    
    init(name: String, maxSpeed: Double, weight: Int, fuel: Double, sidecar: Bool) {
        self.sidecar = sidecar
        super.init(name: name, maxSpeed: maxSpeed, weight: weight, fuel: fuel)
    }
    
    //getters
    func getSidecar() -> Bool{
        return sidecar
    }
    
    //setters
    func setSidercar(sidecar: Bool){
        self.sidecar = sidecar
    }
    
    // function that returns if the vehicle is a two wheeled
    func isTwoWheeled() -> Bool {
        return !sidecar
    }
}

