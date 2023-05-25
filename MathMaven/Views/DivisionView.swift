//
//  DivisionView.swift
//  MathMaven
//
//  Created by Russell Gordon on 2023-05-24.
//

import SwiftUI

struct DivisionView: View {
    
        
        // MARK: Stored properties
        
        // The numbers to be subtracted
        @State var firstValue = Int.random(in: 1...144)
        @State var secondValue = 0  // Will be updated once view loads
        
        // Holds whatever input was provided by the user
        @State var input = ""
        
        // Has the user's answer been checked?
        @State var answerChecked = false
        
        // Was the user's given answer correct?
        @State var answerCorrect = false
        
        // MARK: Computed properties

        // The correct response
        var correctResponse: Int {
            return firstValue - secondValue
        }

    
    // The user interface to show
    var body: some View {
        
        VStack(spacing: 0) {
            
            // 1. Present question
            Group {
                HStack {
                    Text(Operation.division.rawValue)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("\(firstValue)")
                        Text("\(secondValue)")
                    }
                }
                
                Divider()
            }
            .padding(.horizontal)
            
            // 2. Accept answer
            HStack {
                
                ZStack {
                    
                    // Only show this when the answer was found to be correct
                    if answerCorrect == true {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.green)
                    }
                    
                    // Show this when the answer was checked and found to be false
                    if answerChecked == true && answerCorrect == false {
                        Image(systemName: "x.square")
                            .foregroundColor(.red)
                    }
                }
                
                Spacer()
                
                TextField("",
                          text: $input)
                .multilineTextAlignment(.trailing)
            }
            .padding(.horizontal)
        }

        VStack {
            Text("Division")
            Text(Operation.division.rawValue)
        }
        .font(Font.custom("SF Pro", size: 64))
    }
}

struct DivisionView_Previews: PreviewProvider {
    static var previews: some View {
        DivisionView()
    }
}
