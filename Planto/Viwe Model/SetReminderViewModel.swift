
import Foundation
import Observation


@Observable
class SetReminderViewModel {
    var plantName = ""
    var room = "Bedroom"
    let rooms = ["Bedroom", "Living Room", "Kitchen", "Balcony", "Bathroom"]
    var light = "Full Sun"
    let Lights = ["Full Sun", "Partial Sun", "Low Light" ]
    var wateringDay = "Every Day"
    let wateringDays = [ "Every Day","Every 2 Days","Every 3 Days", "Once a Week",  "Every 10 Days", "Every 2 Weeks" ]
    var water = "20-50 ml"
    let waters = [ "20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml" ]
}
