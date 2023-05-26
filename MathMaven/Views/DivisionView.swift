import SwiftUI

struct DivisionView: View {
    
    @State private var firstValue = 0
    @State private var secondValue = 0
    @State private var userAnswer = ""
    @State private var answerChecked = false
    @State private var isAnswerCorrect = false
    
    var correctAnswer: Int {
        return computeCorrectAnswer()
    }
    
    private func computeCorrectAnswer() -> Int {
        return firstValue / secondValue
    }
    
    var body: some View {
        VStack {
            Text("Division")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            Text("\(firstValue) ÷ \(secondValue)")
                .font(.title)
                .padding(.bottom, 40)
            
            TextField("Enter your answer", text: $userAnswer)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 40)
            
            Button(action: {
                checkAnswer()
            }) {
                Text("Check Answer")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .disabled(answerChecked)
            
            if answerChecked {
                Text(isAnswerCorrect ? "Correct!" : "Incorrect!")
                    .font(.title)
                    .foregroundColor(isAnswerCorrect ? .green : .red)
                    .padding(.top, 20)
            }
            
            Spacer()
            
            Button(action: {
                generateNewQuestion()
            }) {
                Text("New Question")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
            .disabled(!answerChecked)
        }
        .padding()
        .onAppear {
            generateNewQuestion()
        }
    }
    
    func generateNewQuestion() {
        firstValue = Int.random(in: 1...144)
        secondValue = Int.random(in: 1..<firstValue)
        userAnswer = ""
        answerChecked = false
        isAnswerCorrect = false
    }
    
    func checkAnswer() {
        if let answer = Int(userAnswer) {
            isAnswerCorrect = answer == correctAnswer
        } else {
            isAnswerCorrect = false
        }
        answerChecked = true
    }
}

struct DivisionView_Previews: PreviewProvider {
    static var previews: some View {
        DivisionView()
    }
    
}
