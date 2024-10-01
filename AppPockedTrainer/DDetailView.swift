import SwiftUI

// Структура для представлення вправ
struct Exercise: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct DDetailView: View {
    @Binding var selectedExerciseName: String?
    @Binding var selectedImage: String?

    @Environment(\.presentationMode) var presentationMode

    let exercises: [Exercise] = [
        Exercise(name: "Присідання", imageName: "1"),
        Exercise(name: "Випади", imageName: "2"),
        Exercise(name: "Підтягування", imageName: "3"),
        Exercise(name: "Віджимання", imageName: "1"),
        Exercise(name: "Прес", imageName: "2"),
        Exercise(name: "Жим лежачи", imageName: "3"),
        Exercise(name: "Тяга", imageName: "1"),
        Exercise(name: "Станова тяга", imageName: "2"),
        Exercise(name: "Мертва тяга", imageName: "3"),
        Exercise(name: "Біцепс", imageName: "1"),
        Exercise(name: "Трицепс", imageName: "2"),
        Exercise(name: "Планка", imageName: "3")
    ]

    var body: some View {
        
        ScrollView {
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 20) {
                ForEach(exercises) { exercise in
                    VStack {
                        Button(action: {
                            selectedExerciseName = exercise.name
                            selectedImage = exercise.imageName
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(exercise.imageName)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                                .shadow(radius: 5)
                        }
                        Text(exercise.name)
                            .font(.caption)
                    }
                }
            }
            .padding()
        }
    }
}
