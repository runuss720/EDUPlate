//
//  Test2View.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 11/18/24.
//

import SwiftUI

struct Test1View: View {
    @ObservedObject var userProgress: UserProgress
    var body: some View {
        TestView(category: "Tools", userProgress: userProgress, concentration: "Food Preparation")
    }
}

struct Test2View: View {
    @ObservedObject var userProgress: UserProgress
    var body: some View {
        TestView(category: "Ingredients", userProgress: userProgress, concentration: "Food Preparation")
    }
}

struct Test3View: View {
    @ObservedObject var userProgress: UserProgress
    var body: some View {
        TestView(category: "French Terms", userProgress: userProgress, concentration: "International")
    }
}

struct Test4View: View {
    @ObservedObject var userProgress: UserProgress
    var body: some View {
        TestView(category: "Food Safety", userProgress: userProgress, concentration: "Safety")
    }
}

struct Test5View: View {
    @ObservedObject var userProgress: UserProgress
    var body: some View {
        TestView(category: "Basic Techniques", userProgress: userProgress, concentration: "Food Preparation")
    }
}

struct Test6View: View {
    @ObservedObject var userProgress: UserProgress
    var body: some View {
        TestView(category: "Grilling", userProgress: userProgress, concentration: "Food Preparation")
    }
}

struct Test7View: View {
    @ObservedObject var userProgress: UserProgress
    var body: some View {
        TestView(category: "Knife Skills", userProgress: userProgress, concentration: "Food Preparation")
    }
}
