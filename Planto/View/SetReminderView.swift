
import Foundation
import SwiftUI
struct SetReminderView: View {
    
    
    @State private var classSetReminderViewModel = SetReminderViewModel() //for picker
    
    @Environment(\.dismiss) private var dismiss
    
    var plantToEdit2 : PlantModel? = nil
     
    
    //هذا ميزته بيفيدني في التعديل لان فاضي مب شرط فيه نبته فباخذه عشان احط فيه معلومات نبته حاليه واحدثها
    
    var classPlantsViewModel : PlantsViewModel
    
    //اول شي بربط الفيو ذا في فيو مودل الي فيه اراي
    // بدون () بعنب يستقبل اوبجكت
    

    

    var body: some View {
        

        VStack(spacing: 0){
            
            
            //Buttons -> x and check
            HStack(spacing: 85){
                Button
                {
                    dismiss()
                    
                }label: {
                    Image(systemName: "xmark")
                        .frame(width: 44, height: 44)
                        .foregroundStyle(Color.white)
                }
                .glassEffect(.regular.interactive())
                
                
                
                
                Text("Set Reminder")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 16, weight: .semibold))
                
                
                Button{
                    
                    if let plant = plantToEdit2 {
                            
                            var updatedPlant = plant
                        
                            updatedPlant.name = classSetReminderViewModel.plantName
                            updatedPlant.room = classSetReminderViewModel.room
                            updatedPlant.water = classSetReminderViewModel.water
                            updatedPlant.light = classSetReminderViewModel.light
                            updatedPlant.wateringDay = classSetReminderViewModel.wateringDay
                            
                            classPlantsViewModel.editPlant(plant: updatedPlant)
                            
                    } else {
                        
                        let newPlant =
                        PlantModel(name:classSetReminderViewModel.plantName , room: classSetReminderViewModel.room, water: classSetReminderViewModel.water, light: classSetReminderViewModel.light, wateringDay: classSetReminderViewModel.wateringDay)
                        
                        classPlantsViewModel.addPlant(plant: newPlant)}
                    
                    // هنا استخدمت فيو مودل
            dismiss() //close sheet!
                
                }label: {
                    Image(systemName: "checkmark")
                        .frame(width: 44, height: 44)
                        .foregroundStyle(Color.white)
                }
                .disabled(classSetReminderViewModel.plantName.isEmpty)
                .glassEffect(.regular.tint(Color("buttonsColor")).interactive())
            }
            
            .padding(16)
            
            
            
            ZStack{ // enter plant name
                Capsule()
                    .fill(Color(red: 44/255, green: 44/255, blue: 46/255))
                    .frame(height: 59)
                
                HStack(alignment:.center, spacing: 13){
                    
                 Text("Plant Name")
                        .font(.system(size: 18, weight: .regular))
                    TextField("Pothos", text: $classSetReminderViewModel.plantName)
                        .font(.system(size: 17, weight: .regular))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            }
            .padding(.top,45.22)
            .padding(.horizontal, 20)
            
            
            
            
            VStack(spacing: 0) { // pickers
                                
            
                HStack {
                    
                    Label("Room", systemImage: "location")
                        .font(.system(size: 18, weight: .regular))
                    Spacer()
                    
                    Picker("Room", selection: $classSetReminderViewModel.room) {
                        ForEach(classSetReminderViewModel.rooms, id: \.self) {
                            roomName in
                            Text(roomName)
                        }
                    }
                    .labelsHidden()
                    .tint(.gray)
                    .lineLimit(1)
                    .fixedSize()
                }
                .frame(maxHeight: .infinity)

                
                Divider()

                
                HStack {
                    
                    Label("Light", systemImage: "sun.max")
                        .font(.system(size: 18, weight: .regular))
                    Spacer()
                    
                    Picker("Light", selection: $classSetReminderViewModel.light){
                        
                        ForEach(classSetReminderViewModel.Lights, id: \.self) { lightName in
                            Text(lightName)
                        }
               
                    }
                    

                    
                    // ForEach يرسم الخيارات من Lights، و selection يستلم الخيار اللي ينضغط ويكتبه في light

                    .labelsHidden()
                    .tint(.gray)
                    .lineLimit(1)
                    .fixedSize()
                }
                .frame(maxHeight: .infinity)
            }
            
            
            .padding()
            .frame(height: 93)

            .background(Color(red: 44/255, green: 44/255, blue: 46/255), in: RoundedRectangle(cornerRadius: 30))
            .padding(.horizontal, 20)
            .padding(.top, 49.31)
            
            VStack(spacing: 0){
                
                HStack{
                    
                    Label ("Watering Days", systemImage: "drop")
                        .font(.system(size: 18, weight: .regular))
                    Spacer()
                    Picker("", selection: $classSetReminderViewModel.wateringDay){
                        ForEach(classSetReminderViewModel.wateringDays, id: \.self){
                            wateringDaysOptions in Text(wateringDaysOptions)
                        }
                        
                    }
                    
                    .labelsHidden()
                    .tint(.gray)
                    .lineLimit(1)
                    .fixedSize()
                }
                
                
                .frame(maxHeight: .infinity)

                
                Divider()
                
                HStack{
                    Label ("Water", systemImage: "drop")
                        .font(.system(size: 18, weight: .regular))
                    Spacer()
                    
                    Picker("Water", selection: $classSetReminderViewModel.water){
                        ForEach(classSetReminderViewModel.waters, id: \.self){
                            waterOptions in Text(waterOptions)
                        }
                    }
                         .tint(.gray)
                        .labelsHidden()
                        .lineLimit(1)
                        .fixedSize()
                }
                .frame(maxHeight: .infinity)
            }
            
            
            .padding()
            .frame(height: 93)

            .background(Color(red: 44/255, green: 44/255, blue: 46/255), in: RoundedRectangle(cornerRadius: 30))
            .padding(.horizontal, 20)
            .padding(.top, 38.13)
            
            if let deleteplant = plantToEdit2 {
                
                Button{
                    classPlantsViewModel.deletePlant(plant: deleteplant)
                    dismiss()
                }label:{
                    Text("Delete Reminder")
                    .foregroundStyle(Color.red)
                    .font(.system(size: 18, weight: .regular))
                    .frame(maxWidth: .infinity)
                    .frame(width: 370,height: 52)
                    .background(Color(red: 44/255, green: 44/255, blue: 46/255), in: Capsule())
                                    }
                .padding(.top,67.59)
                }
            }

          
            Spacer()
            
        //هنا عشان تطلع له البيانات اذا ضغط عنصر من الليست
        .onAppear{
            if let Eplant2 = plantToEdit2 {
                classSetReminderViewModel.plantName = Eplant2.name
                classSetReminderViewModel.room = Eplant2.room
                classSetReminderViewModel.light = Eplant2.light
                classSetReminderViewModel.water = Eplant2.water
                classSetReminderViewModel.wateringDay = Eplant2.wateringDay
                
            }
            
        }
            
        }
        
       
        
        }
        
  


#Preview {
    SetReminderView(classPlantsViewModel: PlantsViewModel()) // ثاني شي كاني اقول هنا حذ الاراي وشغل التطبيق لاني الريدي سويت اوبجكت من نوعه
}
