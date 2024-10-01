import SwiftUI

struct Test2: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Перейти на следующую страницу", destination: DetailVView())
                .navigationTitle("Главная")
                .tint(.black) // Меняет цвет кнопки "Назад" на красный
        }
    }
}

struct DetailVView: View {
    var body: some View {
        Text("Это детальный экран")
            .navigationTitle("Детали")
    }
}

struct Test2_Previews: PreviewProvider {
    static var previews: some View {
        Test2()
    }
}
