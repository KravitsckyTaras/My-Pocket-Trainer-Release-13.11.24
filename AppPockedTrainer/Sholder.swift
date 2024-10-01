import SwiftUI
import AVKit
import WebKit





// Пример данных для кнопок слайдера
let SHbuttons = [
    SliderButton(
        title: "Протяжка.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://youtube.com/embed/7cEfqmysJfU?feature=share"), // Прямой URL видеофайла
        previewImageName: "3", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.30],
        progressTexts: ["  Трапеціподібна.", "  Середня дельта.", "  Передя дельта.",  "  М'язи синергісти"]
        ,progressColors: [.red, .red, .yellow, .green,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Армійскій жим.",
        description: "",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "4", // Имя изображения из ассетов (опционально).
        progressValues: [1, 0.9, 0.80, 0.80],
        progressTexts: ["  Передня дельта", "  Середня дельта", "  Трапеціподібна",  " Тріцепс"]
        ,progressColors: [.red, .orange, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Жим штанги сидячі.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://youtube.com/embed/obAEwJce_Cg?feature=share"), // Прямой URL видеофайла
        previewImageName: "5", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Передня дельта", "  Середня дельта", "  Задня дельта",  " Трицепс"]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Жим гантель сидячі.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "6", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Передня дельта", "  Середня дельта", "  Задня дельта",  " Трицепс"]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Жим Арнольда",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "7", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Передня дельта", "  Середня дельта", "  Трапеціподібна",  "  Трицепс"]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Відведення гантель через боки.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "8", // Имя изображения из ассетов (опционально).
        progressValues: [1, 0.9, 0.8, 0.3],
        progressTexts: ["  Середня дельта", "  Передня Дельта", "  трапеціподібна",  " Задня дельта"]
        ,progressColors: [.red, .orange, .yellow, .green,]  // Цвета для шкалы прогресса
    ),
    
    SliderButton(
        title: "Підйом гантель перд собою.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/PHP6KnhdUxE?si=GaUeruqqqYFKN95m"), // Прямой URL видеофайла
        previewImageName: "9", // Имя изображения из ассетов (опционально).
        progressValues: [1, 0.9, 0.8, 0.3],
        progressTexts: ["  Передня дельта", "  Середня дельта", "  Трапеціподібна",  " м'язи стабілізатори"]
        ,progressColors: [.red, .orange, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    
    SliderButton(
        title: "Відведденя гантель у нахилі.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/RTIKTjzrGjk?si=1B7jKRBA2CZ0TPFO"), // Прямой URL видеофайла
        previewImageName: "10", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Задня дельта", "  Мала кругла", "  Ромбоподібна",  " Трапеціподібна"]
        ,progressColors: [.red, .red, .orange, .orange,]  // Цвета для шкалы прогресса
    ),
    
    SliderButton(
        title: "Зворотні розведення рук.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/qjuhaAXyAxQ?si=FB4JPc9FkGsAhoyF"), // Прямой URL видеофайла
        previewImageName: "11", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Задня дельта", "  Мала кругла", "  Ромбоподібна",  " Трапеціподібна"]
        ,progressColors: [.red, .red, .orange, .orange,]  // Цвета для шкалы прогресса
    ),
    
    SliderButton(
        title: "Зведення гантель над головою.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "12", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.30],
        progressTexts: ["  Передня дельта", "  Середня дельта", "  Трапеціподібна",  " м'язи стабілізатори"]
        ,progressColors: [.red, .red, .yellow, .green,]  // Цвета для шкалы прогресса
    ),
    



]


// Основное представление, содержащее горизонтальный слайдер и кнопки слайдера.
struct Sholder: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Image("listBumagy")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(SHbuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: SHbuttons[index])) {
                                        SliderButtonView(button: SHbuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true) // Скрыть кнопку «Назад»
    }
}

// Провайдер предварительного просмотра для SwiftUI.
struct SHMuscleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Sholder()
    }
}
