//
//  Array+Identifiable.swift
//  数组的扩展协议
//  Memorize
//
//  Created by sanxi on 2020/9/20.
//  Copyright © 2020 sanxi. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
