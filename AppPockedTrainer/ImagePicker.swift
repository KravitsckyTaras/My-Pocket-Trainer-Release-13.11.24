// ImagePicker для выбора изображения из галереи
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage? // Связь с изображением, которое будет выбрано
    @Environment(\.presentationMode) var presentationMode // Переменная для управления закрытием модального окна

    // Внутренний класс Coordinator для работы с делегатом UIImagePickerController
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker // Ссылка на родительский элемент ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent // Инициализация ссылки на родительский элемент
        }

        // Метод делегата, который вызывается при выборе изображения
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage { // Проверка, было ли выбрано изображение
                parent.image = uiImage // Установка выбранного изображения в переменную
            }
            parent.presentationMode.wrappedValue.dismiss() // Закрытие модального окна
        }

        // Метод делегата, который вызывается при отмене выбора изображения
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss() // Закрытие модального окна
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self) // Создание экземпляра координатора
    }

    // Создание и настройка контроллера UIImagePickerController
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController() // Инициализация контроллера для выбора изображения
        picker.delegate = context.coordinator // Назначение координатора в качестве делегата
        return picker // Возврат настроенного контроллера
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Метод, необходимый для соответствия протоколу UIViewControllerRepresentable, но не используется
    }
}
