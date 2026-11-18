import UserNotifications // فيها تولز تساعد على انشاد اشعارات وجدولتها

class NotificationManager {
    
    func sendNotification(){
        
        
        //1- ask foe permission
        let center = UNUserNotificationCenter.current()
        
        // كانه يجيب لنا مركز الاشهعارات بالايفون عشان نتعامل معه كانه وسيط بين نطام الايفون وللتطبيق
        // current يعني التطبيق الحالي
        
        
        
        // هنا مو صار فيه ربط؟ الحين يطلب ان المستخدم يوافق على الاشعارات والصوت
        
        // options يختار انواع الاشعارات هنا
        center.requestAuthorization(options: [.alert, .sound]) {
            granted, error in
            
            if let error = error {
                print("Error adding notification: \(error.localizedDescription)")

                return
                        }

            // granted يعلمنا اذا وافق او لا
            
            if granted {
                
                // 2- content
                let content = UNMutableNotificationContent() // هذا كلاس جاهز لانشاء محتوى  للاشعار
                
                content.title = "Planto"
                content.body = "Hey! let's water your plant"
                content.sound = .default
                
                // 3- trigger
                //timeInterval انتطري مدة اكس واطلعي
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats:false )
                
                // 4- request
                //جمع المحتوى والوقت والاسم التعريفي
                let request = UNNotificationRequest(
                    identifier: "PlantReminder",
                    content: content,
                    trigger: trigger
                )
                //5-  register request
                center.add(request) { error in
                    if let error = error {
                        print("Error adding notification: \(error.localizedDescription)")

                        
                                       }}
                
                //يعني نرسل الطلب إلى النظام ليجدول الإشعار ويعرضه في الوقت المحدد.
                
            }
            
            
            
        }
    }
    
    
}
