//
//  HomeView.swift
//  Little Habits, Progress
//
//  Created by neda khalajnejad on 2026-04-30.
//

import SwiftUI
import SwiftData

struct HomeView: View {
     @Query var query: [HabitModel]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        
        ZStack{
            Color("AppBackground")
                .ignoresSafeArea()
            VStack {
                Text(Date.now, style: .date)
                    .font(.title)
                    .bold()
                    .padding(.top, 100)
                Text(Date.now, style: .time)
                    .font(.title2)
                    .padding()
                List{
                    Text("Habits: \(query.count)")
                    ForEach(query) {item in
                        VStack(alignment: .leading, spacing: 4){
                            Text(item.title)
                                .font(.headline)
                            
                            
                            HStack{
                                Text("\(item.progress, specifier: "%.0f")%")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Spacer()
                                
                                
                                Button{
                                    if item.isCompletedToday{
                                        item.completionDates.removeAll{Calendar.current.isDateInToday($0)}
                                    }else{
                                        item.completionDates.append(Date.now)
                                    }}
                                label:{
                                    Image(systemName: item.isCompletedToday ? "checkmark.circle.fill" : "checkmark.circle")
                                }
                                .foregroundStyle(
                                    item.isCompletedToday
                                        ? (item.habitType == .build ? Color.green : Color.red)
                                        : Color.gray.opacity(0.5)
                                )
                                .buttonStyle(.plain)
                                Spacer()
                               

                                
                            }
                        }
                    }
                    .onDelete{ indexSet in
                        for index in indexSet{
                            let item = query[index]
                            modelContext.delete(item)
                        }
                    }
                }
                
                .scrollContentBackground(.hidden)
            }
            
        }
    
      
    }
}

#Preview {
    HomeView()
        .modelContainer(for: HabitModel.self , inMemory: true)
}

