

import Foundation

struct PlantModel : Identifiable{
    
    var id = UUID() //store the id from Identifiable
    
    var name: String
    var room : String
    var water : String
    var light : String
    var wateringDay : String
    
    //For the CheckList
    var isWatered : Bool = false
    
    var rowOpacity: Double {
        if isWatered {
            return 0.5
        } else {
            return 1.0
        }
    }
    
    
    
}
