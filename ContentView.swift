//
//  ContentView.swift
//  JetSync
//
//  Created by Wesley Lin on 12/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image(systemName: "airplane.circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.blue)
                
                Text("JetSync")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Plan your sleep schedule for your upcoming flight!")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                NavigationLink(
                    destination: FlightDetailsView()
                        .navigationBarBackButtonHidden(true),
                    label: {
                        Text("Start Planning")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                )
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
} 
