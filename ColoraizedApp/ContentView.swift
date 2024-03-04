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
                    .padding(.bottom, 40)
                
                VStack(spacing: 10) {
                    
                    SliderView(value: $redSliderValue, color: .red)
                    SliderView(value: $greenSliderValue, color: .green)
                    SliderView(value: $blueSliderValue, color: .blue)
                        .toolbar {
                            ToolbarItem(placement: .keyboard) {
                                HStack {
                                    Spacer()
                                    
                                    Button("Done") {
                                        applyTextFieldValue()
                                    }
                                }
                            }
                        }
                }
                .focused($focusedState)
                Spacer()
            }
        }.onTapGesture {
            applyTextFieldValue()
        }
    }
}

struct SliderView: View {
    @Binding var value: Double
    let color: Color
        
    var body: some View {
        HStack {
            Text( lround(value).formatted())
                .frame(width: 35, height: 40)
                .foregroundStyle(.white)
                .font(.headline)
                .fontWeight(.heavy)
                .padding([.trailing, .leading], 5)
            
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
                .padding(.trailing, 10)
            
            TextField("", value: $value, formatter: NumberFormatter())
                .frame(width: 50, height: 40)
                .keyboardType(.numberPad)
                .foregroundStyle(.black)
                .textFieldStyle(.roundedBorder)
                .padding(.trailing, 15)
        }
    }
}

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

extension ContentView {
    func applyTextFieldValue() {
        focusedState = false // dismiss keyboard
    }
}

#Preview {
    ContentView()
}
