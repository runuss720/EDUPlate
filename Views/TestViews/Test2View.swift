//
//  Test2View.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 11/18/24.
//

import SwiftUI

struct Test2View: View {
    @ObservedObject var userProgress: UserProgress
    var body: some View {
        TestView(category: "Ingredients", userProgress: userProgress)
    }
}

#Preview {
    Test2View(userProgress: UserProgress())
}

