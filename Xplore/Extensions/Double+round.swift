extension Double {
    func round(to places: Int) -> Double {
        return Double(String(format: "%.\(places)f", self))!
    }
}
