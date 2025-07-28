//
//  TodoApp.swift
//  toDoApp
//
//  Created by Nagendra on 29/07/25.
//

import SwiftUI

struct TodoApp: View {
    @State var item: String = ""
    
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
            
            Spacer()
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding()
    }
    
    
    func addNameFunction(){
        print(item)
    }
}

#Preview {
    TodoApp()
}
