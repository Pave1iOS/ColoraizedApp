//
//  SliderView.swift
//  ColoraizedApp
//
//  Created by Pavel Gribachev on 04.03.2024.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderValue: Double {
        willSet {
            afterValue = sliderValue
        }
    }
    @State private var afterValue: Double = 0
    
    @State private var editing = false
    @State private var isPresented = false
    
    let color: Color
        
    var body: some View {
        HStack {
            Text(lround(sliderValue).formatted())
                .frame(width: 35, height: 40)
                .foregroundStyle(.white)
                .font(.headline)
                .fontWeight(.heavy)
                .padding([.trailing, .leading], 5)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(color)
                .padding(.trailing, 10)
            
            TextField("", value: editing ? $afterValue : $sliderValue, formatter: NumberFormatter(), onEditingChanged: { isEditing in
                sliderValue = afterValue
                editing = isEditing
                isValidation()
            }).alert("Wrong Format!", isPresented: $isPresented) {                Button("OK") {
                    sliderValue = 100
                    afterValue = 100
                }
            } message: {
                Text("please enter a valid value from 0 to 255")
            }
                .frame(width: 50, height: 40)
                .keyboardType(.numberPad)
                .foregroundStyle(.black)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.trailing)
                .padding(.trailing, 15)
        }
    }
}

private extension SliderView {
    func isValidation() {
        if !(0...255).contains(sliderValue) {
            isPresented = true
        }
    }
}

#Preview {
    SliderView(sliderValue: .constant(50), color: .red)
}
