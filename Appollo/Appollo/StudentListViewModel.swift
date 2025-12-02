//
//  StudentListViewModel.swift
//  Appollo
//
//  Created by Avaib on 02/12/2025.
//

import Foundation
import Student_info

class StudentListViewModel: ObservableObject {
    
    private let service: GetStudentsCase
    @Published var studentList = [StudentQuery.Data.Student]()
    init(service: GetStudentsCase) {
        self.service = service
    }
    
    func getUseCase() {
      
        service.execute { [weak self] students in
            guard let self = self else { return }
            
            self.studentList =  students.compactMap { $0 }
            print("students", students)
        }

    }
    
}
