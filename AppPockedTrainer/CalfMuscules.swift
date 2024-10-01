import SwiftUI 

// Пример данных для кнопок слайдера
let CalfMusculesbuttons = [
    // Создаем массив кнопок слайдера, каждая из которых представляет упражнение
    SliderButton(
        title: "Підйом на носки стоячі.", // Заголовок кнопки
        description: "Опис кнопки", // Описание кнопки
        videoURL: URL(string: "https://www.youtube.com/embed/r4mD0TD8880?si=BJe0IraJo9uSRSZv"), // Прямой URL видеофайла (пока пустой)
        previewImageName: "77", // Имя изображения из ассетов
        progressValues: [1, 1, 1, 0], // Значения прогресса для визуализации
        progressTexts: ["   Ікроніжна.", "  Камболоподібна.", "  Довга малогомілкова.",  ""], // Тексты для прогресса
        progressColors: [.red, .red, .red, .yellow] // Цвета для шкалы прогресса
    ),
    // Следующие кнопки слайдера аналогичны первой, но с разными значениями
    SliderButton(
        title: "Підйом платформи у тренажері.",
        description: "Опис кнопки",
        videoURL: URL(string: "https://www.youtube.com/embed/lpdvUgM1VDY?si=XyP9laQ_LQHQtgSI"), // URL видео
        previewImageName: "78",
        progressValues: [1, 1, 0, 0],
        progressTexts: ["  Ікроніжна.", "  Камболоподібна.", "",  ""],
        progressColors: [.red, .red, .red, .yellow]
    ),
    SliderButton(
        title: "Підйом на носки сидячі.",
        description: "Опис кнопки",
        videoURL: URL(string: ""),
        previewImageName: "79",
        progressValues: [1, 1, 0, 0],
        progressTexts: ["  Ікроніжна.", "  Камболоподібна.", "",  ""],
        progressColors: [.red, .red, .red, .yellow]
    ),
    SliderButton(
        title: "Підйоми носки в гору.",
        description: "Опис кнопки",
        videoURL: URL(string: ""),
        previewImageName: "80",
        progressValues: [1, 1, 0, 0],
        progressTexts: ["  Передня великогомілкова.", "  Довгий розгинач пальців стопи.", "  ",  ""],
        progressColors: [.red, .red, .red, .yellow]
    ),
]

// Основное представление, содержащее горизонтальный слайдер и кнопки слайдера.
struct CalfMuscules: View {
    @Environment(\.presentationMode) var presentationMode // Получаем доступ к режиму представления для управления навигацией

    @State private var selectedIndex = 0 // Храним индекс выбранной кнопки
    
    var body: some View {
        NavigationView { // Начинаем навигационное представление
            GeometryReader { geometry in // Используем GeometryReader для адаптации макета
                ZStack {
                    Image("listBumagy") // Задаем фоновое изображение
                        .resizable() // Делаем изображение изменяемым по размеру
                        .aspectRatio(contentMode: .fill) // Заполняем пространство, сохраняя пропорции
                        .edgesIgnoringSafeArea(.all) // Игнорируем безопасные зоны для полного экрана
                    
                    VStack { // Используем вертикальный стек для размещения элементов
                        ScrollView(.horizontal, showsIndicators: false) { // Создаем горизонтальный ScrollView
                            HStack(spacing: 20) { // Используем горизонтальный стек с заданным расстоянием между элементами
                                ForEach(CalfMusculesbuttons.indices, id: \.self) { index in // Перебираем кнопки слайдера
                                    NavigationLink(destination: DetailView(button: CalfMusculesbuttons[index])) { // Создаем переход к DetailView
                                        SliderButtonView(button: CalfMusculesbuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry) // Отображаем кнопку слайдера
                                    }
                                }
                            }
                            .padding() // Добавляем отступы
                        }
                        .padding(.top, -90) // Задаем отрицательный отступ сверху
                        
                    }
                }
                VStack { // Создаем вертикальный стек для размещения основной информации и кнопки
                    Spacer() // Отодвигает содержимое вверх

                    // Иконка "Назад" внизу
                    Button(action: {
                        // Возврат на предыдущий экран
                        presentationMode.wrappedValue.dismiss() // Закрываем текущее представление
                    }) {
                        Image(systemName: "house.fill") // Иконка в виде дома
                            .font(.largeTitle) // Задаем размер шрифта
                            .foregroundColor(.black) // Задаем цвет иконки
                            .padding(.vertical, 10) // Добавляем вертикальные отступы
                    }
                    
                    .frame(maxWidth: .infinity) // Задаем максимальную ширину кнопки
                    .background(Color.gray.opacity(0.2)) // Задаем цвет фона кнопки с прозрачностью
                }
            }
        }
        .navigationBarBackButtonHidden(true) // Скрыть кнопку «Назад» в навигационной панели
    }
}

// Провайдер предварительного просмотра для SwiftUI.
struct CalfMusculesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CalfMuscules() // Предварительный просмотр основного представления
    }
}
