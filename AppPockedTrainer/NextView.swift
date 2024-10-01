import SwiftUI

// Модель даних для зображень
struct ImageData: Identifiable {
    let id = UUID()
    let name: String
    let description: String
}

// Структура для тренувальних днів
struct TrainingDayView: View {
    let title: String
    let exercises: [[String]]
    
    var body: some View {
        VStack {
            ScrollView {
                Text(title)
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black.opacity(0.8)) // Фоновий колір для заголовка
                    .cornerRadius(10)
                    .padding(.bottom)

                ForEach(0..<exercises.count, id: \.self) { dayIndex in
                    VStack {
                        Text("День  \(dayIndex + 1)")
                            .font(.headline)
                            .padding(.top)
                        
                        ForEach(exercises[dayIndex], id: \.self) { exercise in
                            Text(exercise) // Відображаємо назви вправ
                                .font(.title3)
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment: .center) // Центруємо текст
                                .padding()
                                .background(Color.gray.opacity(0.3)) // Фоновий колір для тексту
                                .cornerRadius(10)
                        }
                    }
                    .padding(.bottom)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }
            }
            
        }
        
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: ContentView()) {
                        Image(systemName: "house")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
    
}

// Структура для відображення інформації про бодибілдерів
struct BodybuilderView: View {
    let imageName: String
    let description: String
    let title: String
    let exercises: [[String]]

    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                TrainingDayView(title: title, exercises: exercises)
            }
        }
    }
}

// Специфічні представлення для кожного бодібілдера
struct Arny2View: View {
    let exercises = [
        ["Жим штанги: 3-4*10", "Жим штанги під кутом: 40г. 3-4*10", "Пуловер з гантеллю: 3-4*10", "Підтягування зворотнім хватом: 3-4*10", "Тяга штанги у нахилі: 3-4*10", "Станова тяга: 3-4*10", "Скручування: 5*25"],
        ["Швунг: 3-4*10", "Махи гантель через боки: 3-4*10 ", "Протяжка до підборіддя: 3-4*10", "Армійский жим: 3-4*10", "Згинання рук зі штангою: 3-4*10", "Згинання рук з гантелями: 3-4*10", "Жим штанги вузьким хватом: 3-410", "Французький із под голови: 3-4*10", "Згинання запьястка зі штангою: 3-4*10", "Зворотні скпучування: 5*25"],
        ["Присідання зі штангою: 3-4*10", "Впади: 3-4*10", "Сгинання ніг лежачі: 3-4*10", "Станова тяга: 3-4*10", "Доброго ранку: 3-4*10", "Підйом на носки зі штангою: 3-4*10", "Скручування: 5*25"],
        ["Жим штанги: 3-4*10", "Жим штанги під кутом: 40г. 3-4*10", "Пуловер з гантеллю: 3-4*10", "Підтягування зворотнім хватом: 3-4*10", "Тяга штанги у нахилі: 3-4*10", "Станова тяга: 3-4*10", "Скручування: 5*25"],
        ["Швунг: 3-4*10", "Махи гантель через боки: 3-4*10 ", "Протяжка до підборіддя: 3-4*10", "Армійский жим: 3-4*10", "Згинання рук зі штангою: 3-4*10", "Згинання рук з гантелями: 3-4*10", "Жим штанги вузьким хватом: 3-410", "Французький із под голови: 3-4*10", "Згинання запьястка зі штангою: 3-4*10", "Зворотні скпучування: 5*25"],
        ["Присідання зі штангою: 3-4*10", "Впади: 3-4*10", "Сгинання ніг лежачі: 3-4*10", "Станова тяга: 3-4*10", "Доброго ранку: 3-4*10", "Підйом на носки зі штангою: 3-4*10", "Скручування: 5*25"],
        ["Відпочинок"]
        
    ]
    
    var body: some View {
        BodybuilderView(imageName: "Arny2",
                        description: "Опис для Arny2",
                        title: "План тренування: \nАрнольда Шварценегера.",
                        exercises: exercises)
    }
}

struct KayGView: View {
    let exercises = [
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        
    ]
    
    var body: some View {
        BodybuilderView(imageName: "KayG",
                        description: "",
                        title: "План тренування: \nКая Гріна.",
                        exercises: exercises)
    }
}

struct KevinView: View {
    let exercises = [
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
    ]
    
    var body: some View {
        BodybuilderView(imageName: "Kevin",
                        description: "",
                        title: "План тренування: \nКевіна Леврона.",
                        exercises: exercises)
    }
}

struct KhrisView: View {
    let exercises = [
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
    ]
    
    var body: some View {
        BodybuilderView(imageName: "Khris",
                        description: "Ось ваш план тренування для Кріса Бумстеда",
                        title: "План тренування: \nКріса Бумстеда.",
                        exercises: exercises)
    }
}

struct OhernView: View {
    let exercises = [
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
    ]
    
    var body: some View {
        BodybuilderView(imageName: "Ohern",
                        description: "",
                        title: "План тренування: \nМайка Охерна.",
                        exercises: exercises)
    }
}

// Основне представлення NextView, яке відображає вибране зображення
struct NextView: View {
    var imageName: String
    
    var body: some View {
        switch imageName {
        case "Arny2":
            Arny2View()
        case "KayG":
            KayGView()
        case "Kevin":
            KevinView()
        case "Khris":
            KhrisView()
        case "Ohern":
            OhernView()
        default:
            Text("Зображення не знайдено")
                .font(.headline)
                .padding()
        }
    }
}

struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NextView(imageName: "Arny2")
                .previewDisplayName("Arny2 Preview")
            
            NextView(imageName: "KayG")
                .previewDisplayName("KayG Preview")
            
            NextView(imageName: "Kevin")
                .previewDisplayName("Kevin Preview")
            
            NextView(imageName: "Khris")
                .previewDisplayName("Khris Preview")
            
            NextView(imageName: "Ohern")
                .previewDisplayName("Ohern Preview")
        }
    }
}
