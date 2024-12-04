import SwiftUI

struct ScheduleView: View {
    let flightDetails: FlightDetails
    let sleepSchedule: SleepSchedule
    
    private var timeZoneOffset: TimeInterval {
        // A simplified example, @Ian input prper timezone data here
        3600 * 8 // Assuming 8 hours difference for example
    }
    
    private var scheduleItems: [(String, String, Bool)] {
        let flightDuration = flightDetails.arrivalTime.timeIntervalSince(flightDetails.departureTime)
        
        return [
            // Before Flight
            ("12 hours before departure",
             "\(formatTime(flightDetails.departureTime.addingTimeInterval(-12 * 3600))): Stay awake",
             true),
            
            ("8 hours before departure",
             "\(formatTime(flightDetails.departureTime.addingTimeInterval(-8 * 3600))): Try to sleep",
             false),
            
            // During Flight
            ("Start of flight",
             "\(formatTime(flightDetails.departureTime)): Stay awake",
             true),
            
            ("Mid flight",
             "\(formatTime(flightDetails.departureTime.addingTimeInterval(flightDuration/2))): Sleep if possible",
             false),
            
            // After Landing
            ("After landing",
             "\(formatTime(flightDetails.arrivalTime)): Stay awake",
             true),
            
            ("Evening at destination",
             "\(formatTime(flightDetails.arrivalTime.addingTimeInterval(4 * 3600))): Sleep at local time",
             false)
        ]
    }
    
    private func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    var body: some View {
        List {
            ForEach(scheduleItems, id: \.0) { item in
                TimelineView(
                    period: item.0,
                    recommendation: item.1,
                    isAwake: item.2
                )
            }
        }
        .navigationTitle("Your Schedule")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TimelineView: View {
    let period: String
    let recommendation: String
    let isAwake: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(period)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text(recommendation)
                .font(.body)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(isAwake ?
                      Color.green.opacity(0.15) :
                      Color.red.opacity(0.15))
                .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
        )
        .listRowInsets(EdgeInsets())
        .listRowBackground(Color.clear)
        .padding(.vertical, 4)
    }
} 
