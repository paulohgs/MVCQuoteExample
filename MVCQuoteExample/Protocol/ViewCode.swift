//
//  ViewCode.swift
//  MVCQuoteExample
//
//  Created by Paulo Henrique Gomes da Silva on 31/01/23.
//

import Foundation

protocol ViewCoding {
    func setupView()
    func setupHierarchy()
    func setupConstraints()
}

extension ViewCoding {
    func buildLayout() {
        setupView()
        setupHierarchy()
        setupConstraints()
    }
}
