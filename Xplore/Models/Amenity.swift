enum Amenity : String{
    case Pool = "Pool"
    case Wifi = "Wifi"
    case Kitchen = "Kitchen"
    case Free_Parking = "Free Parking"
    case Hot_Tub = "Hot Tub"
    case Washing_Machine = "Washing Machine"
    case Air_Conditioning = "Air Conditioning"
    case Self_CheckIn = "Self CheckIn"
    case Pets_Allowed = "Pets Allowed"
    case Smoke_Alarm = "Smoke Alarm"
    case CarbonMonoxide_Alarm = "CarbonMonocide Alarm"
    case Fire_Extinguisher = "Fire Extinguisher"
    case First_Aid_Kit = "First Aid Kit"
    
    static func fromRawValue(rawValue: String) -> Amenity? {
           return Amenity(rawValue: rawValue)
    }
}
