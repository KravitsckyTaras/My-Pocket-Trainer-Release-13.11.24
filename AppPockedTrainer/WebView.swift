import WebKit // Импортируем фреймворк WebKit для работы с веб-контентом, в данном случае, с WKWebView.
import SwiftUI // Импортируем фреймворк SwiftUI для создания пользовательского интерфейса.

/// WKWebView для отображения YouTube видео.
struct WebView: UIViewRepresentable { // Создаем структуру WebView, которая реализует протокол UIViewRepresentable для интеграции UIKit-компонентов в SwiftUI.
    let url: URL // Определяем свойство url, которое будет хранить URL адрес для загрузки в WKWebView.
    
    func makeUIView(context: Context) -> WKWebView { // Реализуем метод makeUIView, который создает и возвращает экземпляр WKWebView.
        return WKWebView() // Возвращаем новый объект WKWebView.
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) { // Реализуем метод updateUIView, который обновляет WKWebView при изменении состояния.
        uiView.load(URLRequest(url: url)) // Загружаем URL-адрес в WKWebView, используя URLRequest.
    }
}

