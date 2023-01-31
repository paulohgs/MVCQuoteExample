//
//  ViewController.swift
//  MVCQuoteExample
//
//  Created by Paulo Henrique Gomes da Silva on 31/01/23.
//

import UIKit

class ViewController: UIViewController {

    let quoteView = QuoteView()
    var quoteModel = Quote(anime: "", character: "", quote: "")

    override func loadView() {
        view = quoteView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func getQuote() {
        Task {
            do {
                self.quoteModel = try await API().fetch()
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
}

