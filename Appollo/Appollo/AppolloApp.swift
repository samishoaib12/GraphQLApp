//
//  AppolloApp.swift
//  Appollo
//
//  Created by Avaib on 20/11/2025.
//

import SwiftUI

@main
struct AppolloApp: App {
    var body: some Scene {
        WindowGroup {
            StudentListView(model: StudentListViewModel(service: GetStudentsCase(repository: StudentRepository())))
        }
    }
}
