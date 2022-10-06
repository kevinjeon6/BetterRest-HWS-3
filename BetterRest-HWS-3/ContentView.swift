//
//  ContentView.swift
//  BetterRest-HWS-3
//
//  Created by Kevin Mattocks on 9/29/22.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    //MARK: - Computed property
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        
        return Calendar.current.date(from: components) ?? Date.now
        
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 3...18, step: 0.25)
                }
                
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Daily coffee intake")
                        .font(.headline)
                    Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                }
                
                
                
            }//Vstack
        }
        .navigationTitle("BetterRest")
        .toolbar {
            Button("Calculate") {
                calculateBedTime()
            }
        }
        .alert(alertTitle, isPresented: $showingAlert) {
            Button("OK") { }
        } message: {
            Text(alertMessage)
        }
    }
    
    
    //MARK: - Methods
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is.."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
            
        } catch {
            //Something went wrong
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime"
            
        }
        
        showingAlert = true
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


