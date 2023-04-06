//
//  DiaryModel.swift
//  MelodicDiary
//
//  Created by Kevin Christanto on 05/04/23.
//

import Foundation

struct Diary: Identifiable {
    let id = UUID()
    let date: Date
    let journal: String
    let emoji: String
    let songs: [Songs]    
}
