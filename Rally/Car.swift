class Car : Vehicle{
    var category: String
    
    override init() {
        self.category = "Race Car"
        super.init()
    }
    
    init(name: String, maxSpeed: Double, weight: Int, fuel: Double, category: String) {
        self.category = category
        super.init(name: name, maxSpeed: maxSpeed, weight: weight, fuel: fuel)
    }
    
    //getters
    func getCategory() -> String{
        return category
    }
    
    //setters
    func setCategory(category: String){
        self.category = category
    }
    
    //function to display the vehicle details
    override func displayVehicle() -> String{
        return ("\(name), Max Speed: \(maxSpeed)km/h, Weight: \(weight)kg, Category: \(category)")
    }
}

