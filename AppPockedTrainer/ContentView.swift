import SwiftUI

// Структура данных для кнопок
struct ButtonData {
    let imageName: String
    let size: CGFloat
}

// Пример данных для кнопок
let buttonData = [
    ButtonData(imageName: "START", size: 450),
    ButtonData(imageName: "Arny2", size: 450),
    ButtonData(imageName: "KayG", size: 450),
    ButtonData(imageName: "Kevin", size: 450),
    ButtonData(imageName: "Khris", size: 450),
    ButtonData(imageName: "Ohern", size: 450)
]

struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showContactTrainer = false // Состояние для управления показом окна

    var body: some View {
        NavigationView {
            ZStack {
                // Фоновое изображение
                Image("listBumagy") // Замените "listBumagy" на имя вашего изображения
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all) // Изображение будет занимать весь экран
                
                VStack {
                    // Три кнопки с пользовательскими изображениями вверху
                    HStack {
                        // Первая кнопка с переходом на MusclesView
                        NavigationLink(destination: Muscules()) {
                            Image("worckaut")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .padding()
                                .background(Color.black.opacity(0.4)) // Цвет фона с прозрачностью
                                .cornerRadius(10) // Скругление углов фона
                        }
                        
                        // Вторая кнопка с переходом на BicepsView
                        NavigationLink(destination: MyData()) {
                            Image("biceps")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .padding()
                                .background(Color.black.opacity(0.4)) // Цвет фона с прозрачностью
                                .cornerRadius(10) // Скругление углов фона
                        }
                        
                        // Третья кнопка с переходом на NotebookView
                        NavigationLink(destination: BoockTraining()) {
                            Image("blaknot")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .padding()
                                .background(Color.black.opacity(0.4)) // Цвет фона с прозрачностью
                                .cornerRadius(10) // Скругление углов фона
                        }
                    }
                    
                    // Заголовок под кнопками
                    Text("Обери план тренуваннь")
                        .font(.title)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(25) // Отступы вокруг текста для лучшего внешнего вида фона
                        .background(Color.black.opacity(0.4)) // Цвет фона с прозрачностью
                        .cornerRadius(10) // Скругление углов фона
                    
                    ScrollViewReader { proxy in
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) { // Пространство между кнопками
                                ForEach(buttonData.indices, id: \.self) { index in
                                    NavigationLink(destination: NextView(imageName: buttonData[index].imageName)) { // Переход на новое окно
                                        Image(buttonData[index].imageName) // Использование пользовательского изображения
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 350, height: buttonData[index].size) // Установка размера кнопок
                                            .padding(.horizontal, 5) // Отступы слева и справа для кнопок
                                            .background(Color.black.opacity(0.4)) // Опционально: фон для кнопки
                                            .cornerRadius(10) // Скругление углов
                                            .id(index) // Уникальный идентификатор для прокрутки
                                    }
                                }
                            }
                            .frame(height: 450) // Высота ScrollView
                            .padding(.horizontal) // Отступы по горизонтали для ScrollView
                        }
                        .frame(width: 390) // Ширина ScrollView
                    }

                    // Кнопка внизу экрана
                    Button(action: {
                        showContactTrainer.toggle() // Показать модальное окно
                    }) {
                        Text("Звязатися з тренером")
                            .font(.title2)
                            .frame(width: 330)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $showContactTrainer) {
                        ByContactTrainer() // Окно с сообщением
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true) // Скрыть кнопку «Назад»
    }
}

// Новый вид для окна с текстовыми полями

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
