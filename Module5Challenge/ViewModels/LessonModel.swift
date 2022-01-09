//
//  LessonModel.swift
//  Module5Challenge
//
//  Created by Sooni Mohammed on 2022-01-08.
//

import Foundation

final class LessonModel: ObservableObject {
    @Published var lessons = [Lesson]()
    @Published var filteredLessons = [Lesson]()
    @Published var searchedText = ""
    
    init() {
        getLessons()
    }
    
    
    // MARK: - View Methods
    func search(for text: String) {
        guard text.count > 1 else {
            filteredLessons = lessons
            return
        }
        
        filteredLessons = lessons.filter { $0.title.lowercased().contains(text.lowercased()) }
    }
    
    // MARK: - Data Methods
    func getLessons() {
        let urlString = "https://soonicode1234.github.io/CWC-Module5Challenge-Data/Data.json"
        let url       = URL(string: urlString)
        
        guard let url = url else { return }

        let session = URLSession.shared
        
        session.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let decoder = JSONDecoder()
                let lessons = try decoder.decode([Lesson].self, from: data)
                
                DispatchQueue.main.async {
                    self.lessons = lessons
                    self.filteredLessons = lessons
                }
            } catch {
                print("Error decoding JSON", error)
            }
        }
        .resume()
    }
}
