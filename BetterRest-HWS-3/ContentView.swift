//
//  ContentView.swift
//  BetterRest-HWS-3
//
//  Created by Kevin Mattocks on 9/29/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    
    var body: some View {
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 2...18, step: 0.25)
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

