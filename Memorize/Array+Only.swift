//
//  Array+Only.swift
//  Memorize
//
//  Created by David Zampier on 25/05/20.
//  Copyright © 2020 David Zampier. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
