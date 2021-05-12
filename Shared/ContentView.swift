//
//  ContentView.swift
//  P1-WeSplit
//
//  Created by Gui Ndikum on 2/22/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipParcentage = 2
    let tipparcentages = [10, 15, 20, 25, 0]
    var totalPerPerson: Double {
        // calculate the total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipparcentages[tipParcentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let  amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    var body: some View {
        NavigationView {
        Form {
            Section {
                TextField("Amount", text: $checkAmount)
                    .keyboardType(.decimalPad)
                
                Picker("Number of people", selection: $numberOfPeople){
                    ForEach(2 ..< 100){
                        Text("\($0) people")
                    }
                }
                    
            }
            Section(header: Text("How much tip do you want to leave?")) {
                
                Picker("Tip Percentage", selection: $tipParcentage){
                    ForEach(0 ..< tipparcentages.count) {
                        Text("\(self.tipparcentages[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Amount per person")) {
                Text("$\(totalPerPerson, specifier: "%.2f")")
            }
            
            Section(header: Text("Total Amount")) {
                if tipParcentage == 4
                {
                    Text("$\(totalPerPerson * (Double(numberOfPeople + 2)), specifier: "%.2f")")
                    .background(Color.red)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                else
                {
                    Text("$\(totalPerPerson * (Double(numberOfPeople + 2)), specifier: "%.2f")")
                }
            }
        }
        .navigationBarTitle("WeSplit")
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

