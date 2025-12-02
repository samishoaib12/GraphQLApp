
import Student_info
import Apollo


public protocol StudentRepositoryProtocol {
  
    func getStudents(completion: @escaping ([StudentQuery.Data.Student?]) -> Void)
    func insertStudent(name: String, email: String, age: Int, country: String, completion: @escaping () -> Void)
    
}


final class StudentRepository: StudentRepositoryProtocol {
   

    func getStudents(completion: @escaping ([StudentQuery.Data.Student?]) -> Void) {

        
        Network.shared.apollo.fetch(query: StudentQuery(), cachePolicy: .fetchIgnoringCacheCompletely) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let graphQLResult):
                
            
                if let launchConnection = graphQLResult.data?.students {
                    completion(launchConnection)
                }

            case .failure(let error):
                break
                
          }
      }
        
    }
    
    func insertStudent(name: String, email: String, age: Int, country: String, completion: @escaping () -> Void) {
        
        
        let mutation = CreateStudentMutation(
            name: name,
            email: email,
            age: Int32(age),
            country: country
        )
        
        Network.shared.apollo.perform(mutation: mutation) { result in
           
            switch result {
            case .success(let graphQLResult):
                completion()
            case .failure(let error):
                break
          }
      }

    }
    
}
