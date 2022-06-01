//
//  ListRowView.swift
//  TodoList
//
//  Created by Adwa Sarl on 5/31/22.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? Color.green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item = ItemModel(title: "Demo title", isCompleted: false)
    static var item2 = ItemModel(title: "Second demo title", isCompleted: true)
    static var previews: some View {
        Group {
            ListRowView(item: item)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
