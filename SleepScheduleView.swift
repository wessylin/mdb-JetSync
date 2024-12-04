import SwiftUI

struct SleepSchedule {
    var usualSleepTime: Date = Calendar.current.date(from: DateComponents(hour: 22, minute: 0)) ?? Date()
    var usualWakeTime: Date = Calendar.current.date(from: DateComponents(hour: 7, minute: 0)) ?? Date()
}

struct SleepScheduleView: View {
    let flightDetails: FlightDetails
    @State private var sleepSchedule = SleepSchedule()
    
    var body: some View {
        Form {
            Section(header: Text("When do you usually...")) {
                DatePicker("Go to sleep?",
                          selection: $sleepSchedule.usualSleepTime,
                          displayedComponents: .hourAndMinute)
                
                DatePicker("Wake up?",
                          selection: $sleepSchedule.usualWakeTime,
                          displayedComponents: .hourAndMinute)
            }
            
            Section {
                NavigationLink(
                    destination: ScheduleView(
                        flightDetails: flightDetails,
                        sleepSchedule: sleepSchedule
                    ),
                    label: {
                        Text("Generate Schedule")
                    }
                )
            }
        }
        .navigationTitle("Sleep Schedule")
        .navigationBarTitleDisplayMode(.inline)
    }
} 
