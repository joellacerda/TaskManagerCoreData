//
//  ContentView.swift
//  TaskManagerCoreData
//
//  Created by Joel Lacerda on 20/10/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContent
    @Query private var tasks: [Task]
    @State private var newTaskTitle = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    HStack {
                        Text(task.title)
                        Spacer()
                        Button {
                            task.isDone.toggle()
                        } label: {
                            Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                        }
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            remove(task)
                        } label: {
                            Image(systemName: "trash")
                        }
                    }
                }
                
                HStack {
                    TextField("Nova Tarefa", text: $newTaskTitle)
                    Spacer()
                    Button {
                        let newTask = Task(title: newTaskTitle, isDone: false)
                        save(newTask)
                        newTaskTitle = ""
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newTaskTitle.isEmpty)
                }
            }
            .navigationTitle("Tarefas")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func save (_ task: Task) {
        modelContent.insert(task)
    }
    
    func remove (_ task: Task) {
        modelContent.delete(task)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Task.self, inMemory: false)
}
