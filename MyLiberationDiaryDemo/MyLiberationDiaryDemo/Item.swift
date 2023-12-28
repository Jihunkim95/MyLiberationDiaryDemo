//
//  Item.swift
//  MyLiberationDiaryDemo
//
//  Created by 김지훈 on 2023/12/28.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
