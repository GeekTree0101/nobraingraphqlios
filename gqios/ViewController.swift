//
//  ViewController.swift
//  gqios
//
//  Created by Geektree0101 on 2021/08/25.
//

import UIKit
import Apollo

class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "http://localhost:9011/query")!)
}

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    Network.shared.apollo.fetch(query: ArticleQuery()) { result in
      switch result {
      case let .success(response):

        DispatchQueue.main.async {

          let article = response.data?.article

          let alertController = UIAlertController(
            title: article?.title ?? "???",
            message: article?.content ?? "???",
            preferredStyle: .alert
          )

          alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))

          self.present(alertController, animated: true, completion: nil)
        }

      case let .failure(error):
        print("Failure! Error: \(error)")
      }
    }
  }


}

