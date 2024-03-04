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

    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack {
                RectangleView(color: .blue)
                    .padding(.bottom, 40)
                
                VStack(spacing: 10) {
                    
                    SliderView(value: $redSliderValue, color: .red)
                    SliderView(value: $greenSliderValue, color: .green)
                    SliderView(value: $blueSliderValue, color: .blue)
                    
                }
                Spacer()
            }
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
                .padding(.trailing, 20)
        }
            
    }
}

struct RectangleView: View {
    let color: Color
    
    var body: some View {
        Rectangle()
            .frame(width: 250, height: 120)
            .foregroundStyle(color)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 4)
                    .fill(.white))
    }
}


#Preview {
    ContentView()
}
