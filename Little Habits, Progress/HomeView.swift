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
        NavigationStack{
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
                                    item.isCompleted.toggle()}
                                label:{
                                    Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "checkmark.circle")
                                }
                                .buttonStyle(.plain)
                                Spacer()
                                NavigationLink {
                                    ProgressView()
                                } label: {
                                EmptyView()
                                    
                                }

                                
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
}

#Preview {
    let container = try! ModelContainer(for: HabitModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    let sample = HabitModel(title: "Read books", purposeAmount: 30, habitType: .build)
    container.mainContext.insert(sample)
    return HomeView()
        .modelContainer(container)
}

