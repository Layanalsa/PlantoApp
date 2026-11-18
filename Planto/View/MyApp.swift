import SwiftUI

@main struct MyApp: App {
    @State private var plantViewModel = PlantsViewModel()
    // i need one object
    // الستيت يخلي الأوبجكت يتسوى مرة وحدة بس، وكل ما الصفحة ترسم نفسها من جديد ترجع نفس الأوبجكت، ما يتسوى واحد ثاني فاضي

    var body: some Scene {
        WindowGroup {
            
            MyPlantsView(myPlantsViewModel:  plantViewModel)
            .preferredColorScheme(.dark)
            
            .onAppear {
                plantViewModel.appNotifications()
                            }
        }
    }
}
