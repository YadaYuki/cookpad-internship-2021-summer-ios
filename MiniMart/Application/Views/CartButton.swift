//
//  CartButton.swift
//  MiniMart
//
//  Created by 矢田宙生 on 2021/08/17.
//

import SwiftUI

struct CartButton: View {
    @State var cardViewIsOpen: Bool = false
    @EnvironmentObject var cartState: CartState
    var body: some View {
        Button(action: {
            self.cardViewIsOpen = true
        }) {
            VStack{
                Image(systemName: "folder")
                Text("\(cartState.totalQuantity)")
            }}.sheet(isPresented: $cardViewIsOpen) {
                NavigationView {
                    CartPageView(isCartViewPresented: $cardViewIsOpen)
                }
            }
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton()
    }
}
