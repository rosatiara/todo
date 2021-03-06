//
//  ContentView.swift
//  Shared
//
//  Created by T on 19/12/21.
//

import SwiftUI

struct ContentView: View {
@StateObject var realmManager = RealmManager()
@State private var showAddTaskView = false
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TasksView()
                .environmentObject(realmManager)
            AddButton()
                .padding(30)
            // toggle when the user taps
                .onTapGesture {
                    showAddTaskView.toggle()
                }
        }
        .sheet(isPresented: $showAddTaskView){
            AddTaskView()
                .environmentObject(realmManager)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(Color(red: 237 / 255, green: 220 / 255, blue: 210 / 255))
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
