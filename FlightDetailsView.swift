import SwiftUI

struct FlightDetails {
    var departureCity: String = ""
    var arrivalCity: String = ""
    var departureTime: Date = Date()
    var arrivalTime: Date = Date()
}

struct FlightDetailsView: View {
    @State private var flightDetails = FlightDetails()
    @State private var showDepartureSearch = false
    @State private var showArrivalSearch = false
    @State private var departureSearchText = ""
    @State private var arrivalSearchText = ""
    
    var body: some View {
        Form {
            Section(header: Text("Departure")) {
                Button(action: { showDepartureSearch = true }) {
                    HStack {
                        Image(systemName: "airplane.departure")
                            .foregroundColor(.blue)
                        Text(flightDetails.departureCity.isEmpty ? "From City" : flightDetails.departureCity)
                            .foregroundColor(flightDetails.departureCity.isEmpty ? .gray : .primary)
                    }
                }
                DatePicker("Time", selection: $flightDetails.departureTime)
            }
            
            Section(header: Text("Arrival")) {
                Button(action: { showArrivalSearch = true }) {
                    HStack {
                        Image(systemName: "airplane.arrival")
                            .foregroundColor(.blue)
                        Text(flightDetails.arrivalCity.isEmpty ? "To City" : flightDetails.arrivalCity)
                            .foregroundColor(flightDetails.arrivalCity.isEmpty ? .gray : .primary)
                    }
                }
                DatePicker("Time", selection: $flightDetails.arrivalTime)
            }
            
            Section {
                NavigationLink(
                    destination: SleepScheduleView(flightDetails: flightDetails),
                    label: {
                        Text("Next")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                )
                .disabled(flightDetails.departureCity.isEmpty || flightDetails.arrivalCity.isEmpty)
            }
        }
        .navigationTitle("Flight Details")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showDepartureSearch) {
            NavigationView {
                CitySearch(
                    searchText: $departureSearchText,
                    selectedCity: $flightDetails.departureCity
                )
                .navigationTitle("Select Departure City")
            }
        }
        .sheet(isPresented: $showArrivalSearch) {
            NavigationView {
                CitySearch(
                    searchText: $arrivalSearchText,
                    selectedCity: $flightDetails.arrivalCity
                )
                .navigationTitle("Select Arrival City")
            }
        }
    }
}
