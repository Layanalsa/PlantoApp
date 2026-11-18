
import Foundation
import SwiftUI

struct MyPlantsView: View {
    @State private var showSetReminder : Bool = false
    @AppStorage("EmptyState")private var showEmptyState :Bool = false // يحفظ اخر شي صار
    
    var  myPlantsViewModel : PlantsViewModel
    
    
    var body: some View {
        
        ZStack {
            
            
            
            VStack(spacing: 4){
                Text("My Plants 🌱")
                    .font(.system(size: 34 , weight: .bold))
                //                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.leading,16)
                    .padding(.top, 83)
                    .ignoresSafeArea()
                
                
                Rectangle()
                    .fill(Color("dividerColor"))
                    .frame(height: 1)
                    .padding(.top, 20)
                
               // Text("\(myPlantsViewModel.plants.count)")
                
                if !myPlantsViewModel.plants.isEmpty {
                TodayReminderView(todayPlansViewModel: myPlantsViewModel )
                    
                }
                
            // every array has is empty
                else if showEmptyState {
                    VStack{
                        Text("No reminders set yet.. ")
                            .font(.system(size: 20, weight: .semibold ))
                            .foregroundStyle(Color("noReminder"))
                            .padding(.top,307)
                    }
                }
                
                else{
                    Image("uiPlant")
                        .resizable()
                        .scaledToFit()
                    
                        .frame(width: 164, height: 200)
                        .padding(.top,77)
                    
                    Text("Start your plant journey!")
                        .font(.system(size: 25, weight: .bold))
                    //  .foregroundStyle(Color.white)
                        .padding(.top,37)
                        Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .frame(width: 315)
                        .padding(.top,25)
                    
                    
                    Button{
                        showSetReminder = true
                        
                    }label: {
                        Text("Set Plant Reminder ")
                            .font(.system(size: 16 , weight:.regular))
                            .foregroundStyle(.white)
                            .frame(width: 280, height: 42)
                        
                            .clipShape(Capsule())
                        
                    }
                    
                    .glassEffect(.regular.tint(Color("buttonsColor")).interactive())
                    .padding(.top,105)
                }
            
                Spacer()
                
            }
        
            
            .overlay(alignment: .bottomTrailing) {
                if showEmptyState {
                    
                    Button{
                        showSetReminder = true
                    }label: {
                        Image(systemName: "plus")
                            .font(.system(size: 24, weight: .medium))
                            .foregroundStyle(.white)
                            .frame(width: 50, height: 50)
                    }
                    .glassEffect(.regular.tint(Color("buttonsColor")).interactive())
                    .padding(.trailing, 20)
                    .padding(.bottom, 40)
                    
                }}
            
            
            
            .sheet(isPresented: $showSetReminder, onDismiss: {
                showEmptyState = true
            }) {
                
                SetReminderView(classPlantsViewModel: myPlantsViewModel)
                // انا مضطره دامني حطيت استقبال اوبجكت في الصفحه احطها بيت الاقاوس ونقطتان رئيسيتان للاستقبال الثاني هالضفحه
                    .presentationBackground(Color("sheetColor"))
            }
        
            }
                .frame(maxHeight: .infinity)
                .ignoresSafeArea()
            
            
            
        
        
    }
}


#Preview {
    MyPlantsView(myPlantsViewModel:PlantsViewModel())
}
