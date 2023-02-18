//
//  PopoverView.swift
//  MenuBarLinks
//
//  Created by Dhanuka Perera on 18/02/2023.
//

import SwiftUI

struct PopoverView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(sortDescriptors:[])
    var links: FetchedResults<QLLink>
    
    @State private var linkTitle: String = ""
    @State private var linkURL: String = ""
        
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(links, id: \.wrappedID){ link in
                HStack{
                    Link(link.wrappedTitle,destination: link.wrappedURL)
                    
                    Spacer()
                    
                    Button{
                        NSPasteboard.general.clearContents()
                        NSPasteboard.general.setString(link.url!, forType: .string)
                        AppDelegate.popover.performClose(nil)
                    } label: {
                        Image(systemName: "arrow.right.doc.on.clipboard")
                    }
                    .buttonStyle(.plain)
                }
                
               
            }
     
            Divider()
                .padding(.vertical,4)
            
            
            VStack {
                TextField("Title", text:$linkTitle )
                TextField("URL",text: $linkURL)
                
                HStack {
                    Button("Quit") {
                        NSApplication.shared.terminate(nil)
                    }
                    Spacer()
                    Button("Save") {
                        if URL (string: linkURL) != nil && !linkTitle.isEmpty && !linkURL.isEmpty {
                            let qlink = QLLink(context: viewContext)
                            qlink.id = UUID()
                            qlink.title = linkTitle
                            qlink.url = linkURL
                            
                            try? viewContext.save()
                            
                            linkTitle = ""
                            linkURL = ""
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
           
        }
        .padding()
        .frame(width: 250)
    }
}

struct PopoverView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverView()
    }
}
