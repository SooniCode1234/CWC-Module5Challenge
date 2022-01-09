//
//  LessonDetailView.swift
//  Module5Challenge
//
//  Created by Sooni Mohammed on 2022-01-08.
//

import SwiftUI
import AVKit

struct LessonDetailView: View {
    
    let lesson: Lesson
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Text(lesson.title)
                    .font(.largeTitle.weight(.bold))
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VideoPlayer(player: AVPlayer(url: URL(string: lesson.url)!))
                    .frame(height: 350)
            }
        }
    }
}

struct LessonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LessonDetailView(lesson: Lesson(id: 1,
                                            title: "How To Make An App for Beginners 2021 / SwiftUI - Lesson 1",
                                            url: "https://codewithchris.github.io/Module5Challenge/Lesson%201.mp4"))
        }
    }
}
