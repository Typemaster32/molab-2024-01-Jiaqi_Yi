//
//  ContentView.swift
//  TestiOSApp
//
//  Created by Jiaqi Yi on 2/7/24.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    Text("Hello, world!")
                }
            }
        }
        VStack {
            Text("Just inside of body")
                .font(.largeTitle)
            HStack {
                Text("Drug from the library...")
                    .font(.subheadline)
                Spacer();
                Text("Together in HStack")
                    .font(.subheadline)
            }
        }
        .padding()
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Good Morning!!")
                .font(.headline).foregroundColor(.blue)
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
                .font(.title3).foregroundColor(.purple)
            Section {
                Text("Hello, world!")
            }
            
            Section {
                Text("Hello, world!")
                Text("Hello, world!")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
