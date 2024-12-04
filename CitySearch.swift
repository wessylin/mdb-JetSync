import SwiftUI

struct City: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let country: String
    
    static let commonCities = [
        City(name: "Taipei", country: "Taiwan"), //Best in the World
        City(name: "New York", country: "United States"),
        City(name: "London", country: "United Kingdom"),
        City(name: "Tokyo", country: "Japan"),
        City(name: "Paris", country: "France"),
        City(name: "Sydney", country: "Australia"),
        City(name: "Singapore", country: "Singapore"),
        City(name: "Dubai", country: "UAE"),
        City(name: "Hong Kong", country: "China"),
        City(name: "Seoul", country: "South Korea"),
        City(name: "Toronto", country: "Canada"),
        City(name: "Los Angeles", country: "United States"),
        City(name: "San Francisco", country: "United States"),
        City(name: "Bangkok", country: "Thailand"),
        City(name: "Shanghai", country: "China"),
        City(name: "Mumbai", country: "India"),
        City(name: "Amsterdam", country: "Netherlands"),
        City(name: "Barcelona", country: "Spain"),
        City(name: "Berlin", country: "Germany"),
        City(name: "Istanbul", country: "Turkey"),
        City(name: "Rome", country: "Italy")
    ]
}

struct CitySearch: View {
    @Binding var searchText: String
    @Binding var selectedCity: String
    @Environment(\.dismiss) private var dismiss
    
    var filteredCities: [City] {
        if searchText.isEmpty {
            return City.commonCities
        }
        return City.commonCities.filter {
            $0.name.lowercased().contains(searchText.lowercased()) ||
            $0.country.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        List {
            ForEach(filteredCities) { city in
                Button(action: {
                    selectedCity = city.name
                    dismiss()
                }) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(city.name)
                            .font(.headline)
                        Text(city.country)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .searchable(text: $searchText, prompt: "Search for a city")
    }
} 
