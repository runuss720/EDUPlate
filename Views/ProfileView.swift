//
//  Untitled.swift
//  MyProject
//
//  Designed in DetailsPro
//  Copyright © (My Organization). All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    
                }
                .font(.system(.headline, weight: .medium))
                Image("pfp")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .clipped()
                    .mask { RoundedRectangle(cornerRadius: 67, style: .continuous) }
                HStack(spacing: 4) {
                    ForEach(0..<5) { _ in // Replace with your data model here
                        VStack {
                            
                        }
                        .frame(width: 80)
                        .clipped()
                    }
                }
                .padding()
                VStack(spacing: 4) {
                    Text("Ruby Nuss")
                        .font(.headline)
                    Text("Joined November 2024")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                    Text("")
                        .underline()
                        .foregroundStyle(.blue)
                        .font(.subheadline)
                }
                .frame(width: 250)
                .clipped()
                HStack {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                        
                    }
                }
                .foregroundStyle(.secondary)
                .font(.title2)
                .padding(.top, 40)
                .padding(.bottom, 8)
                .padding(.horizontal, 4)
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 1), GridItem(.flexible(), spacing: 1), GridItem(.flexible(), spacing: 1)], spacing: 1) {
                    ForEach(0..<5) { _ in // Replace with your data model here
                        
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .clipped()
            .padding(.top, 78)
            .padding(.bottom, 150)
        }
        .overlay(alignment: .top) {
            // Status Bar
            HStack {
                Text("9:41")
                    .frame(width: 109)
                    .clipped()
                    .font(.system(.body, weight: .semibold))
                Spacer()
                HStack(spacing: 5) {
                    Image(systemName: "cellularbars")
                        .imageScale(.small)
                    Image(systemName: "wifi")
                        .imageScale(.small)
                    Image(systemName: "battery.100")
                        .symbolRenderingMode(.hierarchical)
                        .font(.system(.body, weight: .light))
                }
                .frame(width: 109)
                .clipped()
                .font(.system(.body, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.top, 5)
            .frame(maxWidth: .infinity)
            .clipped()
            .frame(height: 53)
            .clipped()
            .background(Color(.systemBackground))
        }
    }
}

#Preview {
    ProfileView()
}