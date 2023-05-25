//
//  MathMavenApp.swift
//  MathMaven
//
//  Created by Russell Gordon on 2023-05-24.
//

import SwiftUI

@main
struct MathMavenApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                AdditionView()
                    .tabItem {
                        Image(systemName: "plus.circle")
                        Text("Add")
                    }

                SubtractionView()
                    .tabItem {
                        Image(systemName: "minus.circle")
                        Text("Subtract")
                    }

                MultiplicationView()
                    .tabItem {
                        Image(systemName: "multiply.circle")
                        Text("Mutiply")
                    }

                DivisionView()
                    .tabItem {
                        Image(systemName: "divide.circle")
                        Text("Divide")
                    }

            }
        }
    }
}
