
import Foundation
import SwiftUI
struct SetReminderView: View {
    
    
    
    @State private var ViewModel = SetReminderViewModel()
    
    

    

    var body: some View {
        

        VStack{
            HStack(spacing: 85){
                Button
                {
                    
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
                    
                }label: {
                    Image(systemName: "checkmark")
                        .frame(width: 44, height: 44)
                        .foregroundStyle(Color.white)
                }
                .glassEffect(.regular.tint(Color("buttonsColor")).interactive())
            }
            
            .padding(16)
            
            
            
            ZStack{
                Capsule()
                    .fill(Color(red: 44/255, green: 44/255, blue: 46/255))
                    .frame(height: 59)
                
                HStack(alignment:.center, spacing: 7){
                    
                 Text("Plant Name")
                    TextField("Pothos", text: $ViewModel.plantName)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            }
            .padding(.top,53.43)
            .padding(.horizontal, 20)
            
            
            
            
            VStack(spacing: 0) {
                                
            
                HStack {
                    
                    Label("Room", systemImage: "location")
                    Spacer()
                    Picker("Room", selection: $ViewModel.room) {
                        ForEach(ViewModel.rooms, id: \.self) {
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
                    Spacer()
                    Picker("Light", selection: $ViewModel.light) {
                        ForEach(ViewModel.Lights, id: \.self) { lightName in
                            Text(lightName)
                        }
                    }
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
                    Spacer()
                    Picker("", selection: $ViewModel.wateringDay){
                        ForEach(ViewModel.wateringDays, id: \.self){
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
                    Spacer()
                    
                    Picker("Water", selection: $ViewModel.water){
                        ForEach(ViewModel.waters, id: \.self){
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
            

            
            
            
            
            Spacer()
            
            
        }
          
        
        
        
        }
        
    }



#Preview {
    SetReminderView()
}
