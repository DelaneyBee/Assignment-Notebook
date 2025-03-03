//
//  AssignmentList.swift
//  Assignemt Notebook
//
//  Created by Delaney Blaszinski on 1/29/25.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var items : [AssignmentItem] {
        didSet {
            if let encodedData = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encodedData, forKey: "data")
            }
        }
    }
    init() {
        if let data = UserDefaults.standard.data(forKey: "data") {
            if let decodedData = try?
                JSONDecoder().decode([AssignmentItem].self, from: data) {
                self.items = decodedData
                return
                
            }
        }
        items = []
    }
}
