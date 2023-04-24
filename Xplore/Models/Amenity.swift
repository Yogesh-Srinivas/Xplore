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
    case CarbonMonoxide_Alarm = "CarbonMonoxide Alarm"
    case Fire_Extinguisher = "Fire Extinguisher"
    case First_Aid_Kit = "First Aid Kit"
    
    static func fromRawValue(rawValue: String) -> Amenity? {
           return Amenity(rawValue: rawValue)
    }
    
    static func getImage(for amenity : Amenity) -> String{
        switch amenity{
        case .Air_Conditioning:
            return "air.conditioner.horizontal"
        case .CarbonMonoxide_Alarm:
            return "carbon.monoxide.cloud"
        case .Fire_Extinguisher:
            return "flame"
        case .First_Aid_Kit:
            return "cross.case"
        case .Free_Parking:
            return "parkingsign.circle"
        case .Hot_Tub:
            return "bathtub"
        case .Kitchen:
            return "fork.knife"
        case .Pets_Allowed:
            return "pawprint"
        case .Pool:
            return "figure.pool.swim"
        case .Self_CheckIn:
            return "person.badge.shield.checkmark"
        case .Smoke_Alarm:
            return "smoke"
        case .Washing_Machine:
            return "washer"
        case .Wifi:
            return "wifi"
        }
    }
    
}
