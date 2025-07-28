//
//  TodoApp.swift
//  toDoApp
//
//  Created by Nagendra on 29/07/25.
//

import SwiftUI
struct itemStruct: Identifiable{
 var id:Int
 var item:String
}


struct TodoApp: View {
    @State var item: String = ""
    @State var items: [itemStruct] = []
    
    var body: some View {
        VStack (alignment: .center, spacing: 16) {
            Text("TO DO!")
                .font(.largeTitle)

            HStack{
                TextField("Add a new task", text:$item)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .border(Color.gray, width: 2)
                .padding(.horizontal , 8)
                
                
                Button("Add"){
                   addNameFunction()
                }
                .padding(.horizontal , 18)
                    
            }
            VStack{
                ForEach(items) { itemStruct  in
                    HStack{
                        Text("\(itemStruct.item)").font(.title)
                        Button("X"){
                            deleteItem(id: itemStruct.id)
                        }
                    }
                }
            }
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding()
    }
    
    
    func addNameFunction(){
        items.append(itemStruct(id: items.count, item: item));
        item = ""
        print(items)
    }
    func deleteItem(id: Int){
        
        items.remove(at: id)
    }
}

#Preview {
    TodoApp()
}
