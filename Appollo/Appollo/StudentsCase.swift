
import Student_info



public protocol StudentsUseCaseProtocol {
    
    func execute(completion: @escaping ([StudentQuery.Data.Student?]) -> Void)
    func insert(name: String, email: String, age: Int, country: String, completion: @escaping () -> Void)
    
}


final class StudentsCase: StudentsUseCaseProtocol {
    
    private let repository: StudentRepository
    
    init(repository: StudentRepository) {
        self.repository = repository
    }
    
    func execute( completion: @escaping ([StudentQuery.Data.Student?]) -> Void) {
        repository.getStudents(completion: completion)
        
    }
    
    func insert(name: String, email: String, age: Int, country: String, completion: @escaping () -> Void) {
        repository.insertStudent(name: name, email: email, age: age, country: country, completion: completion)
    }
    
    
}



