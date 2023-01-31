//
//  QuoteView.swift
//  MVCQuoteExample
//
//  Created by Paulo Henrique Gomes da Silva on 31/01/23.
//

import UIKit

class QuoteView: UIView {

    private var animeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var characterLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var quoteLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [animeLabel, characterLabel, quoteLabel])
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureView(model: Quote) {
        animeLabel.text = model.anime
        characterLabel.text = model.character
        quoteLabel.text = model.quote
    }
}

extension QuoteView: ViewCoding {
    func setupView() {
        backgroundColor = .systemBackground
    }

    func setupHierarchy() {
        addSubview(stack)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
}
