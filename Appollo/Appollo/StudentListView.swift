//
//  ContentView.swift
//  Appollo
//
//  Created by Avaib on 20/11/2025.
//

import SwiftUI
import Apollo
import Student_info


struct StudentListView: View {
    @StateObject var model: StudentListViewModel
    @State private var showAddStudent = false
    var body: some View {
        
        VStack {
            
            List {
                ForEach(0..<$model.studentList.count, id: \.self) { index in
                    StudentView(id: "\(model.studentList[index].id)", name: model.studentList[index].name ?? "")
                }
            }
            .listStyle(.plain)
            
            
        }
        .padding()
        .sheet(isPresented: $showAddStudent) {
                      AddStudentView { student in
                          
                          model.insertStudent(name: student.name ?? "", email: student.email ?? "", age: student.age ?? 0, country: student.country ?? "") {
                              model.getUseCase()
                          }
                          print("student",student)
                        //  model.addStudent(student)
                      }
                  }
        .onAppear {
            model.getUseCase()
        }
        
        .navigationTitle("Students")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showAddStudent = true
                        } label: {
                            Image(systemName: "plus")
                                .font(.title2)
                        }
                    }
                }

    }
}

#Preview {
    
}

struct StudentView: View {
    let id: String
    let name: String
    
    var body: some View {
    
        VStack(alignment: .leading) {
            HStack {
                Text("ID:")
                Text(id)
                    .font(.system(size: 14))
            }
            
            HStack {
                Text("Name:")
                Text(name)
                    .font(.system(size: 14))
            }
            
        }
    }


}

struct AddStudentView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var email = ""
    @State private var age = ""
    @State private var country = ""
    
    var onSave: (StudentModel) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Student Info")) {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                    TextField("Age", text: $age)
                        .keyboardType(.numberPad)
                    TextField("Country", text: $country)
                }
            }
            .navigationTitle("Add Student")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if let ageInt = Int(age) {
                            let student = StudentModel(
                                id: 0, name: name,
                                email: email,
                                age: ageInt,
                                country: country
                            )
                            
                            onSave(student)
                            dismiss()
                        }
                    }
                    .bold()
                }
            }
        }
    }
}

struct StudentModel: Identifiable, Hashable {
    let id: Int?
    let name: String?
    let email: String?
    let age: Int?
    let country: String?
}
