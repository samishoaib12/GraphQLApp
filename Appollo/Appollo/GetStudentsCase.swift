
import Student_info



public protocol StudentsUseCaseProtocol {
    
    func execute(completion: @escaping ([StudentQuery.Data.Student?]) -> Void)
    
    
}


final class GetStudentsCase: StudentsUseCaseProtocol {
    
    private let repository: StudentRepository
    
    init(repository: StudentRepository) {
        self.repository = repository
    }
    
    func execute( completion: @escaping ([StudentQuery.Data.Student?]) -> Void) {
        repository.getStudents(completion: completion)
        
    }
    
    
}



