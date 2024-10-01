import SwiftUI

// Экран Muscles
struct Muscules: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Фоновое изображение
                Image("listBumagy") // Замените "listBumagy" на имя вашего изображения
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all) // Изображение будет занимать весь экран
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        // Первая иконка
                        NavigationLink(destination: Chest()) {
                            Image("IconMuscle5")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                        
                        // Вторая иконка
                        NavigationLink(destination: Back()) {
                            Image("IconMuscle1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                        
                        // Третья иконка
                        NavigationLink(destination: Trapezia()) {
                            Image("IconMuscle12")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                        
                        // Четвертая иконка
                        NavigationLink(destination: Sholder()) {
                            Image("IconMuscle10")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                        
                        // Пятая иконка
                        NavigationLink(destination: Biceps()) {
                            Image("IconMuscle3")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                        
                        // Шестая иконка
                        NavigationLink(destination: Triceps()) {
                            Image("IconMuscle11")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                        
                        // Седьмая иконка
                        NavigationLink(destination: Chest()) {
                            Image("IconMuscle9")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                        
                        // Восьмая иконка
                        NavigationLink(destination: Chest()) {
                            Image("IconMuscle2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                        
                        // Девятая иконка
                        NavigationLink(destination: Chest()) {
                            Image("IconMuscle8")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                        
                        // Десятая иконка
                        NavigationLink(destination: Chest()) {
                            Image("IconMuscle7")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                        
                        // Одиннадцатая иконка
                        NavigationLink(destination: Forearm()) {
                            Image("IconMuscle4")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                        
                        // Двенадцатая иконка
                        NavigationLink(destination: Chest()) {
                            Image("IconMuscle6")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationBarBackButtonHidden(true) // Скрыть кнопку «Назад»
        .toolbar {
            // Основной контейнер для кнопок на одной строке
            ToolbarItemGroup(placement: .navigationBarLeading) {
                HStack {
                    // Кнопка для возврата на предыдущее окно
                    
                    // Остальные кнопки навигации
                    NavigationLink(destination: ContentView()) {
                        Image(systemName: "house") // Иконка для "Home"
                            .foregroundColor(.black)
                    }
                    NavigationLink(destination: Muscules()) {
                        Image(systemName: "figure")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
    
    // Определение макета сетки: 3 столбца
    private var columns: [GridItem] {
        [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    }
}

struct Muscules_Previews: PreviewProvider {
    static var previews: some View {
        Muscules()
    }
}
