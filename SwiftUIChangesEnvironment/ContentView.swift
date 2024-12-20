//
//  ContentView.swift
//  SwiftUIChangesEnvironment
//
//  Created by Lori Rothermel on 12/12/24.
//

import SwiftUI
import SwiftData

@Observable
class Light {
    var isOn: Bool = false
}  // class Light

struct LightView: View {
    @Bindable var light: Light
    
    var body: some View {
        VStack {
            Text(light.isOn ? "Light is ON" : "Light is OFF")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(light.isOn ? .red : .black)
            Toggle(isOn: $light.isOn) {
                EmptyView()
            }  // Toggle
        }  // VStack
        
        .fixedSize()
        
    }  // some View
}  // struct LightView


struct Room: View {
    @Environment(Light.self) private var light
        
    var body: some View {
        LightView(light: light)
    }  // some View
    
}  // struct Room


struct Cabin: View {
    @Environment(Light.self) private var light
        
    var body: some View {

        Image(systemName: light.isOn ? "lightbulb.fill" : "lightbulb")
            .font(.largeTitle)
            .foregroundColor(light.isOn ? .yellow : .white)
            .padding(.top, 25)
    }  // some View
}  // struct Cabin



struct ContentView: View {
    @Environment(Light.self) private var light
    
    var body: some View {
        VStack {
            Room()
            Cabin()
        }  // VStack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(light.isOn ? .white : .black.opacity(0.25))
        
    }  // some View
    
}  // ContentView


#Preview {
    ContentView()
        .environment(Light())
}
