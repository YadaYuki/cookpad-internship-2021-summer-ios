import Foundation
import Combine

final class CartState: ObservableObject{
    @Published var cart: [CartItem] = []
    
    func add(product: FetchProductsQuery.Data.Product){
        if let itemIdx = cart.firstIndex(where: {$0.product.id == product.id}){
            var cartItem = cart[itemIdx]
            cartItem.quantity += 1
            cart[itemIdx] = cartItem
        }else{
            cart.append(CartItem(product: product, quantity: 1))
        }
    }
    func clearCart(){
        cart = cart
    }
    var  totalQuantity: Int {
        cart.map{$0.quantity}.reduce(0,+)
    }
    var totalPrice:Int{
        cart.map{$0.quantity * $0.product.price}.reduce(0,+)
    }
}
