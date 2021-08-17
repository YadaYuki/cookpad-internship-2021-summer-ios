//
//  ProductListPageView.swift
//  MiniMart
//
//  Created by 矢田宙生 on 2021/08/17.
//

import SwiftUI

struct ProductListPageView: View {
    var products:[FetchProductsQuery.Data.Product] = []
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        List(products,id:\.id){ product in
            HStack(alignment: .top){
                RemoteImage(urlString: product.imageUrl).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                VStack(alignment:.leading){
                Text(product.name)
                    Spacer().frame(height:8)
                Text(product.summary)
                    Spacer()
                Text("\(product.price)円")
                    .frame(maxWidth:.infinity,alignment: .trailing)
                }
                .padding(.vertical, 8)
            }
        }
    }
}

struct ProductListPageView_Previews: PreviewProvider {
    static let products = [
        FetchProductsQuery.Data.Product(
            id: UUID().uuidString,
            name : "商品 \(1)",
            price: 100,
            summary: "美味しい食材 \(1)",
            imageUrl: "https://image.cookpad-mart.com/dummy/1"
        ),
        FetchProductsQuery.Data.Product(
            id: UUID().uuidString,
            name : "商品 \(2)",
            price: 200,
            summary: "美味しい食材 \(2)",
            imageUrl: "https://image.cookpad-mart.com/dummy/2"
        )
    ]
    static var previews: some View {
        ProductListPageView(products: products)
    }
}
