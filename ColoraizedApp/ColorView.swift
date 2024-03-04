//
//  ColorView.swift
//  ColoraizedApp
//
//  Created by Pavel Gribachev on 04.03.2024.
//

import SwiftUI

struct RectangleView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Rectangle()
            .frame(width: 250, height: 120)
            .foregroundStyle(
                Color(red: red/255, green: green/255, blue: blue/255))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 4)
                    .fill(.white))
    }
}

#Preview {
    RectangleView(red: 22, green: 123, blue: 90)
}
