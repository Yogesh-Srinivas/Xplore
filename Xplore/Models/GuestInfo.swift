struct GuestInfo{
    var numberOfAdult : Int
    var numberOfChildren : Int
    var numberOfInfant : Int
    
    var numberOfGuests : Int {
        return numberOfAdult + numberOfChildren + numberOfInfant
    }
}
