//
//  ContentView.swift
//  SwiftUI Playground
//
//  Created by Timur Piriev on 17.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    enum Example: String {
        case matchedGeometryEffect = "Matched Geomentry Effect"
    }

    let listOfExamples: [Example] = [.matchedGeometryEffect]
    
    var body: some View {
        NavigationView {
            ForEach(listOfExamples, id: \.rawValue) { example in
                NavigationLink(example.rawValue) {
                    switch example {
                    case .matchedGeometryEffect:
                        MatchedGeometryEffectView()
                    }
                }
            }
            .padding()
            .navigationTitle("List of views")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
