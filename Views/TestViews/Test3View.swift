//
//  Test3View.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 11/18/24.
//

import SwiftUI

struct Test3View: View {
    @ObservedObject var userProgress: UserProgress
    var body: some View {
        TestView(category: "French Terms", userProgress: userProgress)
    }
}

#Preview {
    Test3View(userProgress: UserProgress())
}
