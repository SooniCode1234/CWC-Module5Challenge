//
//  LessonListView.swift
//  Module5Challenge
//
//  Created by Sooni Mohammed on 2022-01-08.
//

import SwiftUI

struct LessonListView: View {
    
    @StateObject private var model = LessonModel()
    
    var body: some View {
        Text("LessonListView")
    }
}

struct LessonListView_Previews: PreviewProvider {
    static var previews: some View {
        LessonListView()
    }
}
