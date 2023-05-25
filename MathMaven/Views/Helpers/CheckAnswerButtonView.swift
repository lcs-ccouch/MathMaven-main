//
//  CheckAnswerButtonView.swift
//  MathMaven
//
//  Created by Russell Gordon on 2023-05-24.
//

import SwiftUI

struct CheckAnswerButtonView: View {

    // MARK: Stored properties
    
    // Do not need to change original value; can be a regular property
    let input: String
    
    // Do not need to change this value; can be a regular property
    let correctResponse: Int
    
    // This value needs to change at the source of truth
    // on the original view, so use @Binding
    @Binding var answerChecked: Bool
    
    // This value needs to change at the source of truth
    // on the original view, so use @Binding
    @Binding var answerCorrect: Bool

    // MARK: Computed properties
    var body: some View {

        Button(action: {
            checkAnswer()
        }, label: {
            Text("Check Answer")
                .font(.largeTitle)
        })
        .padding()
        .buttonStyle(.bordered)

    }
    
    // MARK: Functions
    
    // Check whether a given answer was correct or not
    func checkAnswer() {
        
        // Can the user's input be converted to an integer?
        guard let providedAnswer = Int(input) else {
            
            // Input could not be
            answerCorrect = false
            
            // Record that the user's answer has been checked
            answerChecked = true

            // End the function, nothing more to do
            return
        }
        
        // Check the provided answer
        if providedAnswer == correctResponse {
            // Celebrate! User's provided answer was correct👍🏼
            answerCorrect = true
        } else {
            // An integer was provided, but it's not correct 😭
            answerCorrect = false
        }
        
        // Record that the user's answer has been checked
        answerChecked = true

    }

}

struct CheckAnswerButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CheckAnswerButtonView(input: "7",
                              correctResponse: 7,
                              answerChecked: .constant(false),
                              answerCorrect: .constant(false))
    }
}
