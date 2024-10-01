import SwiftUI
import UIKit

struct MyData2: View {
    @Environment(\.presentationMode) var presentationMode // Для закрытия текущего представления
    @State private var keyboardHeight: CGFloat = 0
    @State private var textField1: String = ""
    @State private var textField2: String = ""
    @State private var textField3: String = ""
    @State private var textField4: String = ""
    @State private var textField5: String = ""
    @State private var textField6: String = ""

    @State private var showImagePicker: Bool = false // Для отображения галереи
    @State private var selectedImage: UIImage? // Хранение выбранного изображения
    @State private var loadedImage: UIImage? // Хранение загруженного изображения

    @State private var showAlert: Bool = false // Управление отображением окна с сообщением
    @State private var alertMessage: String = "" // Сообщение для отображения

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    VStack {
                        TextField("Об'єм грудної.", text: $textField1)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.top, 20)

                        TextField("Об'єм плеча.", text: $textField2)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.top, 10)

                        TextField("Об'єм біцепса.", text: $textField3)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.top, 10)

                        TextField("Об'єм стегна.", text: $textField4)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.top, 10)

                        TextField("Об'єм ікроножної.", text: $textField5)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.top, 10)

                        TextField("Об'єм талії.", text: $textField6)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.top, 10)
                    }
                    .padding(.horizontal)
                }

                VStack {
                    HStack(spacing: 10) {
                        Button(action: {
                            showImagePicker = true
                        }) {
                            if let image = selectedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 140, height: 200)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .clipped()
                            } else {
                                Text("Моє фото на зараз.")
                                    .frame(width: 140, height: 200)
                                    .background(Color.black.opacity(0.2))
                                    .foregroundColor(.black)
                                    .cornerRadius(8)
                            }
                        }
                        .padding(.horizontal)
                        .sheet(isPresented: $showImagePicker) {
                            ImagePicker(selectedImage: $selectedImage)
                        }

                        Button(action: {
                            print("Вторая кнопка")
                        }) {
                            if let image = loadedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 140, height: 200)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .clipped()
                            } else {
                                Text("Фото зроблине до.")
                                    .frame(width: 140, height: 200)
                                    .background(Color.blue.opacity(0.2))
                                    .foregroundColor(.black)
                                    .cornerRadius(8)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                }
                .padding(.top, 10)
                .padding(.bottom, keyboardHeight)
            }
            .onAppear(perform: subscribeToKeyboardNotifications)
            .onDisappear(perform: unsubscribeFromKeyboardNotifications)

            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "house.fill")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                }
                .padding()

                Button(action: {
                    // Загрузка данных из UserDefaults
                    loadData()
                }) {
                    Image(systemName: "square.and.arrow.up.fill")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                }
                .padding()

                Button(action: {
                    saveData()
                }) {
                    Image(systemName: "square.and.arrow.down.fill")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                }
                .padding()

                Button(action: {
                    clearAllFields() // Очищаем поля и изображения
                }) {
                    Image(systemName: "trash.fill")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                }
                .padding()
            }
            .background(Color.gray.opacity(0.2))
            .navigationBarBackButtonHidden(true)
        }
        .background(
            Image("listBumagy")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
        .overlay(
            VStack {
                if showAlert {
                    Text(alertMessage)
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .transition(.opacity)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                withAnimation {
                                    showAlert = false
                                }
                            }
                        }
                }
            }
            .padding()
        )
    }

    private func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
            if let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                self.keyboardHeight = keyboardSize.height
            }
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
            self.keyboardHeight = 0
        }
    }

    private func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func saveData() {
        let userDefaults = UserDefaults.standard

        if !textField1.isEmpty {
            userDefaults.set(textField1, forKey: "TextField1")
        }
        
        if !textField2.isEmpty {
            userDefaults.set(textField2, forKey: "TextField2")
        }
        
        if !textField3.isEmpty {
            userDefaults.set(textField3, forKey: "TextField3")
        }
        
        if !textField4.isEmpty {
            userDefaults.set(textField4, forKey: "TextField4")
        }
        
        if !textField5.isEmpty {
            userDefaults.set(textField5, forKey: "TextField5")
        }
        
        if !textField6.isEmpty {
            userDefaults.set(textField6, forKey: "TextField6")
        }

        if let image = selectedImage {
            if let imageData = image.jpegData(compressionQuality: 1.0) {
                userDefaults.set(imageData, forKey: "SelectedImage")
            }
        }

        alertMessage = "Дані збережені!"
        showAlert = true // Показываем окно с сообщением
    }

    private func loadData() {
        let userDefaults = UserDefaults.standard
        
        textField1 = userDefaults.string(forKey: "TextField1") ?? ""
        textField2 = userDefaults.string(forKey: "TextField2") ?? ""
        textField3 = userDefaults.string(forKey: "TextField3") ?? ""
        textField4 = userDefaults.string(forKey: "TextField4") ?? ""
        textField5 = userDefaults.string(forKey: "TextField5") ?? ""
        textField6 = userDefaults.string(forKey: "TextField6") ?? ""

        if let imageData = userDefaults.data(forKey: "SelectedImage") {
            loadedImage = UIImage(data: imageData)
        }

        alertMessage = "Дані завантажені!"
        showAlert = true // Показываем окно с сообщением
    }

    private func clearAllFields() {
        textField1 = ""
        textField2 = ""
        textField3 = ""
        textField4 = ""
        textField5 = ""
        textField6 = ""
        selectedImage = nil
        loadedImage = nil
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct MyData2_Previews: PreviewProvider {
    static var previews: some View {
        MyData2()
    }
}
