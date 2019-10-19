class Moto : Vehicle{
    var sidecar: Bool
    
    init(name: String, maxSpeed: Double, weight: Int, fuel: Int, sidecar: Bool) {
        self.sidecar = sidecar
        super.init(name: name, maxSpeed: maxSpeed, weight: weight, fuel: fuel)
    }
    
    func isTwoWheeled() -> Bool {
        return !sidecar
    }
}

