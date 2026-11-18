import SwiftUI

struct TodayReminderView: View {
    var todayPlansViewModel : PlantsViewModel
    
    @State private var plantToEdit : PlantModel? = nil
    
    
 
    
    
    var body: some View {
        
        // MARK: - Completed Plant
     if todayPlansViewModel.allDone(){
         

            VStack(spacing:0){
                
                Image("allDone")
                    .frame(width: 164 , height: 200)
                    .padding(.top, 127)
  
                Text ("All Done! 🎉")
                    .font(.system(size: 25, weight: .bold))
                    .padding(.top,60)
                Text("All Reminders Completed")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(Color.secondary)
                    .padding(.top,14)
                Spacer()
                
            }
     } 
        
        
        // MARK: - Plant List

        else {
            
            VStack(spacing: 0){
                Text(todayPlansViewModel.statusText())
                    .font(.system(size: 18 , weight: .regular))
                    .padding(.top, 38)
                
                
                ProgressView(value: todayPlansViewModel.progress())
                    .tint(Color("buttonsColor"))
                    .frame(width: 361, height: 8)
                    .clipShape(Capsule())
                    .scaleEffect(x: 1, y: 2, anchor: .center)
                    .padding(.top,15)
                
                
                
                
                //بداية الليست
                List{
                    
                    
                    ForEach(todayPlansViewModel.plants){ // array
                        plant in // for each one in rthe array
                        
                        
                        
                        
                        //للصف الواحد:
                        HStack(spacing: 21){
                            
                            Button{
                                /* if
                                 checkedPlants.contains(plant.id) {
                                 checkedPlants.remove(plant.id)
                                 }
                                 
                                 else{
                                 checkedPlants.insert(plant.id)
                                 }
                                 */
                                
                                todayPlansViewModel.markWatered(plant: plant)
                                
                            }label: {
                                if plant.isWatered {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundStyle(Color("greenButton"))
                                        .font(.system(size: 25, weight: .light))
                                    
                                }else{
                                    Image(systemName: "circle")
                                        .foregroundStyle(Color("circleColor"))
                                        .font(.system(size: 25, weight: .light))
                                }
                            }
                            .buttonStyle(.borderless) // يعني اشتغل بس لما أضغط عليك أنت
                            
                            
                            
                            VStack(alignment: .leading, spacing: 4){ // room
                                
                                HStack{
                                    Image(systemName: "location")
                                    
                                        .foregroundStyle(Color.white.opacity(0.5))
                                    
                                    
                                    
                                    Text("in \(plant.room) ")
                                    
                                        .font(.system(size: 15, weight: .regular))
                                        .foregroundStyle(Color.white.opacity(0.5))
                                    Spacer()
                                }
                                
                                
                                HStack{ // name
                                    
                                    Text(plant.name)
                                    
                                        .font(.system(size: 28, weight: .regular))
                                    Spacer()
                                }
                                .padding(.top,1)
                                
                                HStack(spacing: 13){
                                    
                                    HStack(spacing: 4) { //light
                                        Image(systemName: "sun.max")
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Text(plant.light)
                                        
                                        
                                            .font(.system(size: 14, weight: .regular))
                                    }
                                    
                                    .foregroundStyle(Color("yellowText"))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(Color("shape"), in: RoundedRectangle(cornerRadius: 8))
                                    .padding(.top, 8)
                                    
                                    
                                    HStack(spacing: 4){
                                        
                                        Image(systemName: "drop") // watter
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Text(plant.water)
                                        
                                        
                                            .font(.system(size: 14, weight: .regular))
                                    }
                                    .foregroundStyle(Color("blueText"))
                                    .padding(.horizontal,12)
                                    .padding(.vertical, 6)
                                    
                                    .background(Color("shape"),in: RoundedRectangle(cornerRadius: 8))
                                    .padding(.top, 8)
                                 
                                }
                            }.opacity(plant.rowOpacity)
                                .contentShape(Rectangle())

                                .onTapGesture { // معناها "لما اليوزر يضغط على هالشي، نفّذ الي داخل الأقواس".
                                    
                                    plantToEdit = plant //خزناها هنا
                                }
                            
                            
                            // لين هنا
                            
                            
                        }
                        .swipeActions {
                            
                            Button{
                                todayPlansViewModel.deletePlant(plant: plant)
                            }label: {
                                
                                Image(systemName: "trash")
                                //font(.system(size: 14, weight: .regular))
                                
                            }
                            .tint(.red)
                            
                            
                        }
                        
                    }
                }
                .listStyle(.plain)
                .padding(.top, 60)
                .listRowSpacing(13)
                .scrollContentBackground(.hidden)// بدونه هذا بيصير فيه لون
                
                .sheet(item: $plantToEdit){
                    Eplant in
                    SetReminderView(plantToEdit2: Eplant, classPlantsViewModel: todayPlansViewModel)
                     //اسم_الخانة: القيمة
                    //هنا امرر لها نفس الفيو مودل
                   // عشان الحذف والتحديث سوينا كذا
                }
                
                Spacer()
                 
            }
        
        }
        
    
    }
}


#Preview {
    TodayReminderView(todayPlansViewModel: PlantsViewModel())
}

