//
//  ProductDetailPageView.swift
//  MiniMart
//
//  Created by 矢田宙生 on 2021/08/17.
//

import SwiftUI

struct ProductDetailPageView: View {
    var product: FetchProductsQuery.Data.Product
    @State var cardViewIsOpen: Bool = false
    @EnvironmentObject var cartState: CartState
    var body: some View {
        RemoteImage(urlString: product.imageUrl) .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
        VStack(alignment: .leading){
            Text(product.name).frame(alignment: .leading).padding(.vertical,8)
            Text("\(product.price)円").padding(.vertical,8)
            Text(product.summary).padding(.vertical,8)
        }.toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                CartButton()
            }
        }
//        .sheet(isPresented: $cardViewIsOpen) {
//            NavigationView {
//                CartPageView()
//            }
//        }
        Button(action:{cartState.add(product: product)}){
            Text("カートに追加").frame(maxWidth:.infinity).padding(8).background(Color.orange).foregroundColor(Color.white)
        }
    }
}

struct ProductDetailPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ProductDetailPageView(
                product: FetchProductsQuery.Data.Product(
                    id: UUID().uuidString,
                    name: "オクラ",
                    price: 165,
                    summary:"夏バテ防止にネバネバパワーの新鮮オクラをご賞味ください。Mサイズ中心の食べ易い大きさです。グリの野菜は鮮度が生命、オクラのウブ毛を体験して下さい。",
                    imageUrl:"https://minimart-api.s3.ap-northeast-1.amazonaws.com/images/products/1.jpg"
                ))
        }
        
    }
}
