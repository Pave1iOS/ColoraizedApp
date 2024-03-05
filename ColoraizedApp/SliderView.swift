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
            })
                .frame(width: 50, height: 40)
                .keyboardType(.numberPad)
                .foregroundStyle(.black)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.trailing)
                .padding(.trailing, 15)
        }
    }
}

#Preview {
    SliderView(sliderValue: .constant(50), color: .red)
}
