//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by David Zampier on 25/05/20.
//  Copyright © 2020 David Zampier. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        firstIndex { $0.id == matching.id }
    }
}
