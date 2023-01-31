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
        getQuote()
    }

    func getQuote() {
        Task {
            do {
                self.quoteModel = try await API().fetch()
                quoteView.configureView(model: quoteModel)
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
}

