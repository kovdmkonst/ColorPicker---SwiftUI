//
//  ContentView.swift
//  ColorPicker - SwiftUI
//
//  Created by Kovalyov Dmitry on 06.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    @State private var greenChangedValue: String = ""
    @State private var redChangedValue: String = ""
    @State private var blueChangedValue: String = ""
    
    @State private var rectangleColor: Color = .white
    
    
    var body: some View {
        
        VStack {
            
            Rectangle()
                .foregroundColor(Color(red: redSliderValue / 250,
                                       green: greenSliderValue / 250,
                                       blue: blueSliderValue / 250))
                .frame(height: 200)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 7)
                        .foregroundColor(Color(red: blueSliderValue / 250,
                                                green: redSliderValue / 250,
                                                blue: greenSliderValue / 250)))
                .opacity(0.7)
                .padding()
            
                                    
            // redSlider
            
            HStack() {
                ColorSliderView(value: $redSliderValue, changedValue: $redChangedValue, color: .red)
            }
            .padding()
            
            // greenSlider
            HStack() {
                ColorSliderView(value: $greenSliderValue, changedValue: $greenChangedValue, color: .green)
            }
            .padding()
            
            // blueSlider
            
            HStack() {
                ColorSliderView(value: $blueSliderValue, changedValue: $blueChangedValue, color: .blue)
            }
            .padding()
            Spacer()
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}




struct ColorSliderView: View {
    
    @Binding var value: Double
    @Binding var changedValue: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 40) {
            
            Text(String(lround(value)))
                .foregroundColor(color)
                .frame(width: 35, height: 35)
            
            Slider(value: $value, in: 0...255, step: 1)
                .foregroundColor(color)
            
            TextField(String(lround(value)), text: $changedValue)
                .frame(width: 35, height: 35)
            
        }
        
    }
    
}
