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
        TestView(category: "Tools", userProgress: userProgress)
    }
}

struct Test2View: View {
    @ObservedObject var userProgress: UserProgress
    var body: some View {
        TestView(category: "Ingredients", userProgress: userProgress)
    }
}

struct Test3View: View {
    @ObservedObject var userProgress: UserProgress
    var body: some View {
        TestView(category: "French Terms", userProgress: userProgress)
    }
}
/*
#Preview {
    Test2View(userProgress: UserProgress())
}

*/
