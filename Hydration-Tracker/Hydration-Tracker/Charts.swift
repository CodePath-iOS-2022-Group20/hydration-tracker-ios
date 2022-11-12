//
//  Charts.swift
//  Hydration-Tracker
//
//  Created by Ibrahim  Allahbuksh on 11/7/22.
//

import Charts
import SwiftUI
import Parse


let user = PFUser.current()

class SwiftUIViewHostingController: UIHostingController<Charts> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: Charts())
    }
}




struct Item: Identifiable {
    var id = UUID()
    let type: String
    let value: Double
    
}



struct Charts: View {
   
    
    let items: [Item] = [
        Item(type:"today", value: 300),
        Item(type:"Tuesday", value: 800),
        Item(type:"Wednesday", value: 700),
        Item(type:"Thursday", value: 800),
        Item(type:"Friday", value: 1003),
        Item(type:"Saturday", value: 583),
        Item(type:"Sunday", value: 484)
    
    ]
    
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                
                Chart(items){ item in
                    BarMark(
                        x: .value("Department", item.type),
                        y: .value("Profit", item.value)
                        )
                    
                    .foregroundStyle(Color.red.gradient)
                    
                }
                
                .frame(height: 200)
                .padding()
                
            }
            
            .navigationTitle("Statistics")
        }
    }
}

struct Charts_Previews: PreviewProvider {
    static var previews: some View {
        Charts()
    }
}
