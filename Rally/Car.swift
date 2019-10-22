class Car : Vehicle{
    var category: Int
    
    init(name: String, maxSpeed: Double, weight: Int, fuel: Int, category: Int) {
        self.category = category
        super.init(name: name, maxSpeed: maxSpeed, weight: weight, fuel: fuel)
    }
    
    // function that returns the category of the vehicle
    func getCategory() -> Int{
        return category
    }
}

