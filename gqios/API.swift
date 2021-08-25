// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ArticleQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Article {
      article {
        __typename
        title
        content
      }
    }
    """

  public let operationName: String = "Article"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("article", type: .nonNull(.object(Article.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(article: Article) {
      self.init(unsafeResultMap: ["__typename": "Query", "article": article.resultMap])
    }

    public var article: Article {
      get {
        return Article(unsafeResultMap: resultMap["article"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "article")
      }
    }

    public struct Article: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Article"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(title: String, content: String) {
        self.init(unsafeResultMap: ["__typename": "Article", "title": title, "content": content])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var content: String {
        get {
          return resultMap["content"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "content")
        }
      }
    }
  }
}
