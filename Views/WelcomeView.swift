//
//  WelcomeView.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 11/17/24.
//

import SwiftUI
//import CoreLocationUI

import SwiftUI

struct WelcomeView: View {
    @Binding var isVisible: Bool

    var body: some View {
        if isVisible {
            VStack(spacing: 14) {
                Text("❤️")
                    .font(.system(size: 56, weight: .regular, design: .default))
                HStack {
                    Spacer()
                    Text("Welcome to EDUPlate")
                        .font(.system(size: 31, weight: .medium, design: .default))
                        .padding(.bottom, 0)
                        .padding(.top, 0)
                        .foregroundStyle(.black)
                    Spacer()
                }
                Text("This app is dedicated to teaching you the basics of cooking")
                    .padding(.bottom, 60)
                    .font(.system(size: 17, weight: .regular, design: .default))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.black.opacity(0.5))
                    .padding(.horizontal, 30)
                    .lineSpacing(3)
                
                Button(action: {
                    isVisible = false
                }) {
                    Text("Okay, got it!")
                        .font(.system(.title3, weight: .medium))
                        .foregroundStyle(.blue)
                        .mask { RoundedRectangle(cornerRadius: 28, style: .continuous) }
                        .padding(.top, 77)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipped()
        }
    }
}

#Preview {
    // Provide a default value for the `isWelcomeViewVisible` state variable
    WelcomeView(isVisible: .constant(true))
}

