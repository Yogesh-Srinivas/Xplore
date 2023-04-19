struct FilteredLocation{
    var country : String
    var state : String?
    var city : String?
    
    static func ==(lhs : FilteredLocation,rhs : FilteredLocation) -> Bool{
        if lhs.country != rhs.country{
            return false
        }
        
        if let lhsState = lhs.state{
            if let rhsState = rhs.state{
                if lhsState != rhsState{
                    return false
                }
            }else{
                return false
            }
        }else{
            if rhs.state != nil{
                return false
            }
        }
        
        if let lhsCity = lhs.city{
            if let rhsCity = rhs.city{
                if lhsCity != rhsCity{
                    return false
                }
            }else{
                return false
            }
        }else{
            if rhs.city != nil{
                return false
            }
        }
        
        return true
    }
}
