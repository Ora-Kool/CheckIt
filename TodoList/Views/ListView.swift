//
//  ListView.swift
//  TodoList
//
//  Created by Adwa Sarl on 5/31/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture{
                                withAnimation(.easeInOut){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
            
        }
        .navigationTitle("TodoList 📝")
        .navigationBarItems(
            leading: EditButton(), trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
    
    
   
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


