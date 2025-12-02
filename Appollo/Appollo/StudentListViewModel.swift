//
//  StudentListViewModel.swift
//  Appollo
//
//  Created by Avaib on 02/12/2025.
//

import Foundation
import Student_info

class StudentListViewModel: ObservableObject {
    
    private let service: StudentsUseCaseProtocol
    @Published var studentList = [StudentQuery.Data.Student]()
    init(service: StudentsUseCaseProtocol) {
        self.service = service
    }
    
    func getUseCase() {
      
        service.execute { [weak self] students in
            guard let self = self else { return }
            
            self.studentList =  students.compactMap { $0 }
            print("students", students)
        }

    }
    
    func insertStudent( name: String, email: String, age: Int, country: String, completion:@escaping(()->Void)) {
        service.insert(name: name, email: email, age: age, country: country) {
            completion()
        }
    }
    
}
