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
        NavigationView {
            List(model.filteredLessons) { lesson in
                NavigationLink(destination: LessonDetailView(lesson: lesson)) {
                    Text(lesson.title)
                }
            }
            .searchable(text: $model.searchedText)
            .onChange(of: model.searchedText) { newValue in
                model.search(for: newValue)
            }
            .navigationTitle("All Videos")
        }
        .navigationViewStyle(.stack)
    }
}

struct LessonListView_Previews: PreviewProvider {
    static var previews: some View {
        LessonListView()
    }
}
