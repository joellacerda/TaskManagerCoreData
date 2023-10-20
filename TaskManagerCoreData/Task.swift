//
//  Task.swift
//  TaskManagerCoreData
//
//  Created by Joel Lacerda on 20/10/23.
//

import Foundation
import SwiftData

@Model
final class Task {
    
    var title: String
    var isDone: Bool
    
    init(title: String, isDone: Bool) {
        self.title = title
        self.isDone = isDone
    }
}
