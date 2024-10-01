import SwiftUI
import AVKit
import WebKit





// Пример данных для кнопок слайдера
let Thingbuttons = [
    SliderButton(
        title: "Станова тяга.",
        description: "Опис кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/gYI-ItE8al0?si=9ECOFKux_nUWLkax"), // Прямой URL видеофайла
        previewImageName: "60", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці: Великий сідничний м'яз.", "  Стегна квадрицепс.", "  Стегна біцепс.",  "Спина."]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Доброго ранку.",
        description: "Опис кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "61", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0],
        progressTexts: ["  Спина.", "  Сідниці: Великий сідничний м'яз.", "  Стегна біцепс.",  ""]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    
    SliderButton(
        title: "Мертва тяга.",
        description: "Опис кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/o26GO32SS8A?si=EBc7K1x9W-uOGgP7"), // Прямой URL видеофайла
        previewImageName: "71", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0.8],
        progressTexts: ["  Спина .", "  Сідниці.", "  Стегна біцепс.",  "Трапеція, Ромбоподібна"]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Румунська тяга.",
        description: "Опис кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/Sg-1ks5XMYI?si=cYcAlyWUjBJZYYid"), // Прямой URL видеофайла
        previewImageName: "72", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0],
        progressTexts: ["  Спина .", "  Сідниці.", "  Стегна біцепс.",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Гіперестензія.",
        description: "Опис кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "73", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0.8],
        progressTexts: ["  Спина .", "  Сідниці.", "  Стегна біцепс.",  "  Спина, Гомілка"]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Згинання ніг лежачі.",
        description: "Опис кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/ivlMVQGVkg0?si=VrMfdotNnGJ-oojv"), // Прямой URL видеофайла
        previewImageName: "74", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0],
        progressTexts: ["  Стегна біцепс: Двоголовий м'яз стегна.", "  Стегна біцепс : Напівсухожильна.", "  Стегна біцепс : Напівперетинчаста.",  "Гомілка: Ікроніжна."]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
   





]


// Основное представление, содержащее горизонтальный слайдер и кнопки слайдера.
struct ThingBiceps: View {
    @State private var selectedIndex = 0
    @Environment(\.presentationMode) var presentationMode

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
                                ForEach(Thingbuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: Thingbuttons[index])) {
                                        SliderButtonView(button: Thingbuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
                                    }
                                }
                            }
                            .padding()
                        }
                        .padding(.top, -90)
                        
                    }
                }
                VStack {
                    // Ваш основной контент здесь
                    
                    Spacer() // Отодвигает содержимое вверх

                    // Иконка "Назад" внизу
                    Button(action: {
                        // Возврат на предыдущий экран
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "house.fill")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                    }
                    
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))

                }
            }
        }
        .navigationBarBackButtonHidden(true) // Скрыть кнопку «Назад»
    }
}

// Провайдер предварительного просмотра для SwiftUI.
struct ThingBicepsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ThingBiceps()
    }
}
