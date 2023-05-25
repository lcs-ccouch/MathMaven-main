//
//  MultiplicationView.swift
//  MathMaven
//
//  Created by Russell Gordon on 2023-05-24.
//

import SwiftUI

struct MultiplicationView: View {
    var body: some View {
        VStack {
            Text("Multiplication")
            Text(Operation.multiplication.rawValue)
        }
        .font(Font.custom("SF Pro", size: 64))
    }
}

struct MultiplicationView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplicationView()
    }
}
