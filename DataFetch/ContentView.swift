//
//  ContentView.swift
//  DataFetch
//
//  Created by user on 21/06/22.
//


import Foundation
import SwiftUI
struct ContentView: View {
    @State private var exp: String = ""
    var body: some View {
        Text(exp)
        Button {
            Task {
                let (data, _) = try await URLSession.shared.data(from: URL(string:"https://x-math.herokuapp.com/api/random")!)
                let decodedResponse = try? JSONDecoder().decode(mathf.self, from: data)

                let a = "\(decodedResponse?.expression ?? " ") = "
                let b = decodedResponse?.answer ?? 0
                exp = " \(String(describing: a)) \(String(describing: b)) "
                
                
                /*
                exp = ("\(decodedResponse?.expression) \(decodedResponse?.answer)") ?? ""
                */
                 
                 
                 
                 
            }
        } label: {
            Text("Nuova Espressione")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct mathf: Codable {
    
    let expression: String
    let answer: Int
}






