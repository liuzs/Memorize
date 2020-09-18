//
//  Grid.swift
//  Memorize
//
//  Created by sanxi on 2020/9/18.
//  Copyright © 2020 sanxi. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView {
        
    }
    
    init(items: [Item], viewForItem: (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    var body: some View {
        Text("Hello, World!")
    }
}
