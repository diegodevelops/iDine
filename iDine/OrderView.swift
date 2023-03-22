//
//  OrderView.swift
//  iDine
//
//  Created by Diego A. Perez Pares on 12/7/22.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    @Environment(\.editMode) private var editMode
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink("Place Order") {
                        CheckoutView()
                    }
                }
                .disabled(order.items.isEmpty || editMode?.wrappedValue.isEditing == true)
            }
            .navigationTitle("Order")
            .toolbar {
                EditButton()
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
