
import Foundation


@Observable

// اليوزر انتفريسز تراقب البيانات الي بالكلاس  وتتحدث اليوزر انترفيس

class PlantsViewModel {
    var plants : [PlantModel] = []
    let notificationManager = NotificationManager()
    
    
    var wateredCount : Int{
        var count = 0
        for plant in plants {
            if plant.isWatered {
                count+=1
            }
        }
        return count
    }
    
    func addPlant (plant : PlantModel){
        if allDone(){
            plants.removeAll()
        }
        plants.append(plant)
        
       
    }
    
    
    func markWatered (plant: PlantModel){
        if let index = plants.firstIndex(where: {
            $0.id == plant.id // هل العنصر ٠ يساوي الايدي uuid
        }) {
            plants[index].isWatered.toggle()
            sortPlants()
        }
    }
    
    
    
    func progress() -> Double {
        let sumOfPlants = plants.count
        
        if sumOfPlants == 0 {
            return 0
        }
        
        var wateredCount = 0
        for plant in plants {
            if plant.isWatered {
                wateredCount += 1
            }
        }
        
        return Double(wateredCount) / Double(sumOfPlants)
    }
    
    
    
    func deletePlant(plant: PlantModel){
        if let index = plants.firstIndex(where: {
            $0.id == plant.id // هل العنصر ٠ يساوي الايدي uuid
        }) {
            plants.remove(at: index)
        }
    }
    
    func statusText ()-> String {
        if wateredCount == 0 {
            return("Your plants are waiting for a sip 💦")
        }
        else
        {
            return ("\(wateredCount) of your plants feel loved today✨")
        }
        
    }
   
    
    
    func sortPlants(){
        var  notWatered : [PlantModel] = []
        var watered : [PlantModel] = []
        for plant in plants {
                if plant.isWatered {
                    watered.append(plant)
                } else {
                    notWatered.append(plant)
                }
            }
            
            plants = notWatered + watered // عشان تغيير الترتيب 
        }
    
    
    func editPlant (plant: PlantModel){
        if let index = plants.firstIndex(where: {
            $0.id == plant.id // هل العنصر ٠ يساوي الايدي uuid
        }) {
            plants[index] = plant // هنا اقوله يلا دور المعرف حق البلانت ذي واذا لقيته يلا بدله ببلانت الجديده
        }
    }
    
    func allDone () -> Bool {
    return plants.allSatisfy( { // كاني اقول مري على كل عنصر وسميه بلانت وشوفي قيمته
         plant in
            plant.isWatered // الشرط لو ابيه ما يساوي ترو احط ! 
           
            })
    }
    func appNotifications(){
        notificationManager.sendNotification()
    }
    
    

    
    
        }



