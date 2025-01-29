//
//  Test1View.swift
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

#Preview {
    Test1View(userProgress: UserProgress())
}

