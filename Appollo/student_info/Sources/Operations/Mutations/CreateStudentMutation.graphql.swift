// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct CreateStudentMutation: GraphQLMutation {
  public static let operationName: String = "CreateStudent"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation CreateStudent($name: String!, $email: String!, $age: Int!, $country: String!) { createStudent(name: $name, email: $email, age: $age, country: $country) { __typename id name email age country } }"#
    ))

  public var name: String
  public var email: String
  public var age: Int32
  public var country: String

  public init(
    name: String,
    email: String,
    age: Int32,
    country: String
  ) {
    self.name = name
    self.email = email
    self.age = age
    self.country = country
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "name": name,
    "email": email,
    "age": age,
    "country": country
  ] }

  public struct Data: Student_info.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { Student_info.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("createStudent", CreateStudent?.self, arguments: [
        "name": .variable("name"),
        "email": .variable("email"),
        "age": .variable("age"),
        "country": .variable("country")
      ]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      CreateStudentMutation.Data.self
    ] }

    public var createStudent: CreateStudent? { __data["createStudent"] }

    /// CreateStudent
    ///
    /// Parent Type: `Student`
    public struct CreateStudent: Student_info.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { Student_info.Objects.Student }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
        .field("name", String?.self),
        .field("email", String?.self),
        .field("age", Int?.self),
        .field("country", String?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        CreateStudentMutation.Data.CreateStudent.self
      ] }

      /// The id of the student
      public var id: Int { __data["id"] }
      /// The name of the student
      public var name: String? { __data["name"] }
      /// The email of the student
      public var email: String? { __data["email"] }
      /// The age of the student
      public var age: Int? { __data["age"] }
      /// The country of the student
      public var country: String? { __data["country"] }
    }
  }
}
