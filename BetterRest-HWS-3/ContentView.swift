//
//  ContentView.swift
//  BetterRest-HWS-3
//
//  Created by Kevin Mattocks on 9/29/22.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)
                
                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Text("Desired amount of sleep")
                    .font(.headline)
                
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 3...18, step: 0.25)
                
                Text("Daily coffee intake")
                    .font(.headline)
                
                Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                
                
            }//Vstack
        }
        .navigationTitle("BetterRest")
        .toolbar {
            Button("Calculate") {
                calculateBedTime()
            }
        }
    }
    
    
    //MARK: - Methods
    
    func calculateBedTime() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

 /* Stepper
  in: provides a range for the stepper
  
  step: provides increments/decrements but must match the type used for the binding
  
  To fix the formatting we use the modifier .formatted()
  
  */


/* Date Picker
 
 Date.now means today's date
 
 If you want the label gone from the DatePicker, use the modifier .labelHidden() so you can still keep the label for voiceover
 
 displayComponents: .date will show the date, and not the time
 
 *****in: goes before displayComponents*****
 
 in: Date.now...
 This is selecting todays date and going forward. Can't go backwards

 Date range for past such as a birthday use ...Date()
 
 
 
 Check Working with dates when formatting dates (Project 4, part 1)
 
 */


