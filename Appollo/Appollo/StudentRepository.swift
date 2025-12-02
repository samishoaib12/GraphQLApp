
import Student_info
import Apollo

public protocol StudentRepositoryProtocol {
  
    func getStudents(completion: @escaping ([StudentQuery.Data.Student?]) -> Void)
    
}


final class StudentRepository: StudentRepositoryProtocol {
   

    func getStudents(completion: @escaping ([StudentQuery.Data.Student?]) -> Void) {

        
        Network.shared.apollo.fetch(query: StudentQuery()) { [weak self] result in
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
    
}
