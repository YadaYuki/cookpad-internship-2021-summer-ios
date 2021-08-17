import SwiftUI

struct CartPageView: View {
    @EnvironmentObject var cartState: CartState
    @State private var showAlert = false
    @Binding var isCartViewPresented: Bool
    var body: some View {
        VStack{
            List(cartState.cart,id: \.product.id){ cartItem in
                HStack{
                    RemoteImage(urlString: cartItem.product.imageUrl)
                        .frame(width: 100, height: 100)
                    VStack(alignment: .leading, spacing: 0){
                        Text(cartItem.product.name)
                        Spacer().frame(height: 8)
                        Text("\(cartItem.product.price)円")
                        Text("\(cartItem.quantity)個")
                    }
                }
            }
            Text("合計\(cartState.totalPrice)円").frame(maxWidth: .infinity, alignment: .trailing)
            Button(action:{self.showAlert = true}){
                Text("注文する").frame(maxWidth:.infinity).padding(8).background(Color.orange).foregroundColor(Color.white).cornerRadius(3)
            }.alert(isPresented:$showAlert){
                Alert(title:Text("注文が完了しました"),dismissButton: Alert.Button.default(Text("OK")){
                        cartState.clearCart()
                        isCartViewPresented = false
                })
            }
        }.navigationTitle("カート")
        
    }
}

struct CartPageView_Previews: PreviewProvider {
    @State static var isCartViewPresented: Bool = false
    static var previews: some View {
        NavigationView {
            CartPageView(isCartViewPresented: $isCartViewPresented)
        }
    }
}
