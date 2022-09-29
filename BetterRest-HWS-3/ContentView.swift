//
//  ContentView.swift
//  BetterRest-HWS-3
//
//  Created by Kevin Mattocks on 9/29/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = Date.now
    
    var body: some View {
        DatePicker("Select a date", selection: $wakeUp, in: Date.now..., displayedComponents: .date)
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
 
 */


