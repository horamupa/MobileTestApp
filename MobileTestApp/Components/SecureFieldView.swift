////
////  SecureFieldView.swift
////  EffectiveMobileTestApp
////
////  Created by MM on 14.03.2023.
////
//
//import SwiftUI
//
//struct SecureFieldView: View {
//    
//    @Binding private var text: String
//    @State private var isSecured: Bool = true
//    private var title: String
//    
//    init(_ title: String, text: Binding<String>) {
//        self.title = title
//        self._text = text
//    }
//    
//    var body: some View {
//        ZStack(alignment: .trailing) {
//            Group {
//                if isSecured {
//                    SecureField(title, text: $text)
//                } else {
//                    TextField(title, text: $text)
//                }
//            }.padding(.trailing, 32)
//
//            Button(action: {
//                isSecured.toggle()
//            }) {
//                Image(systemName: self.isSecured ? "eye.slash" : "eye")
//                    .accentColor(.gray)
//            }
//        }
//    }
//}
//
//struct SecureFieldView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecureFieldView()
//    }
//}