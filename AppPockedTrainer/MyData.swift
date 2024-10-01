import SwiftUI

// ImagePicker для выбора изображения из галереи
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

// Экран Muscles
struct MyData: View {
    @State private var inputText1: String = "" // Переменные для хранения текста
    @State private var inputText2: String = ""
    @State private var inputText3: String = ""
    @State private var inputText4: String = ""
    @State private var inputText5: String = ""
    @State private var showImagePicker: Bool = false
    @State private var selectedImage: UIImage? = nil
    @State private var savedImage: UIImage? = nil

    var body: some View {
        ZStack {
            Image("listBumagy")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all) // Фоновое изображение, заполняющее экран

            VStack {
                // Добавляем кнопки над полями для текста
                HStack {
                    Button(action: {
                        saveData()
                    }) {
                        Text("Зберегти")
                            .padding()
                            .frame(width: 120, height: 40) // Фиксированный размер кнопки
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .opacity(0.8)
                    }

                    Button(action: {
                        loadData()
                    }) {
                        Text("Згадати")
                            .padding()
                            .frame(width: 120, height: 40) // Фиксированный размер кнопки
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .opacity(0.8)
                    }
                    
                    Button(action: {
                        deleteData()
                    }) {
                        Text("Видалити")
                            .padding()
                            .frame(width: 120, height: 40) // Фиксированный размер кнопки
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .opacity(0.8)
                    }
                }
                .padding(.top, 10) // Отступ сверху для отделения кнопок от верхней части экрана

                VStack(spacing: 10) { // Верхний VStack для ввода текста с интервалом между полями
                    TextField("Ваша вага:", text: $inputText1)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    TextField("Об'єм біцепсу:", text: $inputText2)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    TextField("об'єм грудних:", text: $inputText3)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    TextField("Об'єм талії:", text: $inputText4)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    TextField("Об'єм стегна:", text: $inputText5)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                }
                .padding(.top, 20) // Отступ сверху для отделения текстовых полей от кнопок

                // Поле для отображения сохраненного изображения и нового изображения горизонтально без промежутков
                GeometryReader { geometry in
                    HStack(spacing: 5) { // Убираем промежутки между изображениями
                        VStack {
                            Text("Старе зображення:")
                                .padding(.top, 50)
                                .font(.headline) // Сделать текст жирнее
                                .bold() // Убедиться, что текст жирный
                            if let image = savedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geometry.size.width / 2, height: 300) // Увеличенный размер
                                    .clipped()
                            } else {
                                Text("Изображение \nотсутствует")
                                    .frame(width: geometry.size.width / 2, height: 300)
                                    .background(Color.gray.opacity(0.3))
                            }
                        }
                        
                        VStack {
                            Text("Нове зображення:")
                                .padding(.top, 50)
                                .font(.headline) // Сделать текст жирнее
                                .bold() // Убедиться, что текст жирный
                                
                            if let image = selectedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geometry.size.width / 2, height: 300) // Увеличенный размер
                                    .clipped()
                            } else {
                                Text("Изображение \nотсутствует")
                                    .frame(width: geometry.size.width / 2, height: 300)
                                    .background(Color.gray.opacity(0.2))
                            }
                        }
                    }
                

                    .frame(height: 260) // Фиксированная высота для HStack
                }
                .padding(.top, 20) // Отступ сверху для отделения изображений от текстовых полей

                Spacer() // Разделитель, чтобы кнопка выбора изображения оставалась внизу

                // Кнопка для выбора изображения, закрепленная внизу экрана
                Button(action: {
                    showImagePicker.toggle()
                }) {
                    Text("Выбрать изображение")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .opacity(0.8)
                }
                .padding()
            }
            .navigationBarBackButtonHidden(true) // Скрыть кнопку «Назад»
            .toolbar {
                // Основной контейнер для кнопок на одной строке
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    HStack {
                        Spacer() // Заполняет пространство слева от кнопок
                        
                        NavigationLink(destination: ContentView()) {
                            Image(systemName: "house") // Иконка для "Home"
                                .foregroundColor(.black)
                        }
                        
                        NavigationLink(destination: MyData()) {
                            Image(systemName: "person") // Иконка для "MyData"
                                .foregroundColor(.black)
                        }
                        
                        NavigationLink(destination: BoockTraining()) {
                            Image(systemName: "book") // Иконка для "TrainingBook"
                                .foregroundColor(.black)
                        }
                        
                     
                        
                        Spacer() // Заполняет пространство справа от кнопок
                    }
                }
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $selectedImage)
        }
    }
    

    private func saveData() {
        // Сохранение текстовых данных в UserDefaults
        UserDefaults.standard.set(inputText1, forKey: "inputText1")
        UserDefaults.standard.set(inputText2, forKey: "inputText2")
        UserDefaults.standard.set(inputText3, forKey: "inputText3")
        UserDefaults.standard.set(inputText4, forKey: "inputText4")
        UserDefaults.standard.set(inputText5, forKey: "inputText5")
        
        // Сохранение нового изображения в UserDefaults (посредством преобразования в Data)
        if let image = selectedImage, let imageData = image.jpegData(compressionQuality: 0.8) {
            UserDefaults.standard.set(imageData, forKey: "selectedImage")
        }
    }

    private func loadData() {
        // Загрузка текстовых данных из UserDefaults
        inputText1 = UserDefaults.standard.string(forKey: "inputText1") ?? ""
        inputText2 = UserDefaults.standard.string(forKey: "inputText2") ?? ""
        inputText3 = UserDefaults.standard.string(forKey: "inputText3") ?? ""
        inputText4 = UserDefaults.standard.string(forKey: "inputText4") ?? ""
        inputText5 = UserDefaults.standard.string(forKey: "inputText5") ?? ""

        // Загрузка сохраненного изображения из UserDefaults
        if let imageData = UserDefaults.standard.data(forKey: "selectedImage"), let image = UIImage(data: imageData) {
            savedImage = image
        }
    }
    
    private func deleteData() {
        // Удаление текстовых данных из UserDefaults
        UserDefaults.standard.removeObject(forKey: "inputText1")
        UserDefaults.standard.removeObject(forKey: "inputText2")
        UserDefaults.standard.removeObject(forKey: "inputText3")
        UserDefaults.standard.removeObject(forKey: "inputText4")
        UserDefaults.standard.removeObject(forKey: "inputText5")
        UserDefaults.standard.removeObject(forKey: "selectedImage")
        
        // Очистка состояний переменных
        inputText1 = ""
        inputText2 = ""
        inputText3 = ""
        inputText4 = ""
        inputText5 = ""
        savedImage = nil
    }
}

struct MyData_Previews: PreviewProvider {
    static var previews: some View {
        MyData()
    }
}
