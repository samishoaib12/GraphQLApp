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
    
    var body: some View {
        VStack {
            
            List {
                ForEach(0..<model.studentList.count, id: \.self) { index in
                    StudentView(id: "\(model.studentList[index].id)", name: model.studentList[index].name ?? "")
                }
            }
            .listStyle(.plain)
            
            
        }
        .padding()
        
        .onAppear {
            model.getUseCase()
        }
    }
    
//    init() {
//        // TODO (later in the tutorial)
//        Network.shared.apollo.fetch(query: StudentQuery()) { result in
//            switch result {
//            case .success(let graphQLResult):
//                
//                print("Success! Result: \(graphQLResult)")
//            case .failure(let error):
//                print("Failure! Error: \(error)")
//            }
//        }
//    }
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
