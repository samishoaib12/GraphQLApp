// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct StudentQuery: GraphQLQuery {
  public static let operationName: String = "Student"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Student { students { __typename id name } }"#
    ))

  public init() {}

  public struct Data: Student_info.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { Student_info.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("students", [Student?]?.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      StudentQuery.Data.self
    ] }

    public var students: [Student?]? { __data["students"] }

    /// Student
    ///
    /// Parent Type: `Student`
    public struct Student: Student_info.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { Student_info.Objects.Student }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
        .field("name", String?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        StudentQuery.Data.Student.self
      ] }

      /// The id of the student
      public var id: Int { __data["id"] }
      /// The name of the student
      public var name: String? { __data["name"] }
    }
  }
}
