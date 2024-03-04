//
//  ContentView.swift
//  ColoraizedApp
//
//  Created by Pavel Gribachev on 04.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
        
    @FocusState private var focusedState: Bool

    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack {
                RectangleView(
                    red: redSliderValue,
                    green: greenSliderValue,
                    blue: blueSliderValue
                )
                .padding([.bottom, .top], 40)
                
                VStack(spacing: 10) {
                    SliderView(sliderValue: $redSliderValue, color: .red)
                    SliderView(sliderValue: $greenSliderValue, color: .green)
                    SliderView(sliderValue: $blueSliderValue, color: .blue)
                }
                .focused($focusedState)
                
                Spacer()
            }
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                HStack {
                    Spacer()
                    
                    Button("Done") {
                        dismissKeyboard()
                    }
                }
            }
        }
        .onTapGesture {
            dismissKeyboard()
        }
    }
}

// MARK: Dismiss keyboard
extension ContentView {
    func dismissKeyboard() {
        focusedState = false
    }
}

#Preview {
    ContentView()
}
