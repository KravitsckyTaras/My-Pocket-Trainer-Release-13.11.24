import SwiftUI
import AVKit
import WebKit





// Пример данных для кнопок слайдера
let TRIbuttons = [
    SliderButton(
        title: "Жим вузьким хватом.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/d6OV-6sFDoQ?si=eom731RcfW5jtPEM"), // Прямой URL видеофайла
        previewImageName: "22", // Имя изображения из ассетов (опционально).
        progressValues: [1, 0.8, 0.8, 0],
        progressTexts: [" Тріцепс.", "  Передня дельа.", "  Велика грудна.",  ""]
        ,progressColors: [.red, .yellow, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Віджимання від лавки.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/99yC_HA2ahM?si=MaF8uLJENUYzawf2"), // Прямой URL видеофайла
        previewImageName: "23", // Имя изображения из ассетов (опционально).
        progressValues: [1, 0.9, 0.9, 0],
        progressTexts: [" Тріцепс.", "  Передня дельа.", "  Велика грудна.",  ""]
        ,progressColors: [.red, .orange, .orange, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Французкий жим.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/ko7UzkV_R5Q?si=2VyosRBYVWajjyl7"), // Прямой URL видеофайла
        previewImageName: "24", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.9, 0],
        progressTexts: [" Тріцепс: Довга головка.", "  Тріцепс: Середня головка.", "  Тріцепс: Бокова головка.",  ""]
        ,progressColors: [.red, .red, .orange, .yellow,]  // Цвета для шкалы прогресса
    ),
   
    SliderButton(
        title: "Тріцепс в блоці.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/GuCSlMZOptI?si=OdBYN_sACBBccdn4"), // Прямой URL видеофайла
        previewImageName: "27", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0],
        progressTexts: ["  Довга долонна.", "  Розгинач зап'ястя.", "  Ліктьовий згинач зап'ястя.",  ""]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Однією рукою в блоці.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/nlJLgk4NjIw?si=ijDZEeQrDKTaK28x"), // Прямой URL видеофайла
        previewImageName: "28", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0],
        progressTexts: [" Тріцепс: Довга головка.", "  Тріцепс: Середня головка.", "  Тріцепс: Бокова головка.",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Розгинання руки над головою.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/eP5QtmGFUg0?si=czD29uDkdQMT7ICx"), // Прямой URL видеофайла
        previewImageName: "29", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0],
        progressTexts: [" Тріцепс: Довга головка.", "  Тріцепс: Середня головка.", "  Тріцепс: Бокова головка.",  ""]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),SliderButton(
        title: "Розгинання рукм в нахилі.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/doQXzXHW6E8?si=QyPcSUPM61TAH2R6"), // Прямой URL видеофайла
        previewImageName: "30", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.9, 0.8],
        progressTexts: ["  Довга долонна.", "  Розгинач зап'ястя.",  "  Задня дельта", "  Ліктьовий згинач зап'ястя.", ]
        ,progressColors: [.red, .red, .orange, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Розгинання за голови.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/onjo4edF6v0?si=yLWQMMtE24fTPb0E"), // Прямой URL видеофайла
        previewImageName: "25", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0],
        progressTexts: [" Тріцепс: Довга головка.", "  Тріцепс: Середня головка.", "  Тріцепс: Бокова головка.",  ""],
        progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    
    SliderButton(
        title: "Французький жим сидячі з блоку.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/dz1kJI5sE9k?si=Gy23ui4Lv0GUmjju"), // Прямой URL видеофайла
        previewImageName: "26", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0],
        progressTexts: [" Тріцепс: Довга головка.", "  Тріцепс: Середня головка.", "  Тріцепс: Бокова головка.",  ""],
        progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),




]


// Основное представление, содержащее горизонтальный слайдер и кнопки слайдера.
struct Triceps: View {
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
                                ForEach(TRIbuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: TRIbuttons[index])) {
                                        SliderButtonView(button: TRIbuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
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
struct TRYMuscleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Triceps()
    }
}
