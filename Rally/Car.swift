class Car : Vehicle{
    var category: Int
    
    init(name: String, maxSpeed: Double, weight: Int, fuel: Int, category: Int) {
        self.category = category
        super.init(name: name, maxSpeed: maxSpeed, weight: weight, fuel: fuel)
    }
    
    func getCategory() -> Int{
        return category
    }
}

