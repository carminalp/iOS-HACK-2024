//
//  TicketView.swift
//  RetoBBVA
//
//  Created by Alumno on 24/04/24.
//

import SwiftUI
import Vision

struct TicketView: View {
    @State private var imageTaken: UIImage?
    @State private var recognizedTexts = [String]()
    @State private var isLoading = false
    
    func recognizeCardText(){
        print ("reading text ")
        let requestHandler = VNImageRequestHandler(cgImage: self.imageTaken!.cgImage!)
        
        let recognizeTextRequest = VNRecognizeTextRequest { (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation] else {return}
            
            //Aquí almacenas lo que reconoció del texto
            for observation in observations {
                if let recognizedText = observation.topCandidates(1).first?.string {
                    if let range = recognizedText.range(of: "$") {
                        let indexAfterDollarSign = recognizedText.index(after: range.lowerBound)
                        let substringAfterDollar = recognizedText[indexAfterDollarSign...]
                        self.recognizedTexts.append(String(substringAfterDollar))
                    }
                    print(self.recognizedTexts)
                }
            }
        }
        
        DispatchQueue.global(qos:.userInitiated).async {
            do {
                try requestHandler.perform([recognizeTextRequest])
                self.isLoading = false
            }
            catch {
                print(error)
            }
        }
    }
    
    var pictureTakenView: some View {
        VStack{
            Image (uiImage: self.imageTaken!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .layoutPriority(1)
            Button(action: {
                self.imageTaken = nil
                self.recognizedTexts = [String]()
            }, label: {
                HStack{
                    Image(systemName: "camera")
                    Text("Repetir foto")
                }
            })
            
            // Display info
            List {
                if let lastText = self.recognizedTexts.last {
                    Text(lastText)
                }
            }
        }
    }
                  
    var body: some View {
        VStack {
            if (self.imageTaken == nil){
                CameraView(image: self.$imageTaken)
            }
            else {
                if(!self.isLoading) {
                    self.pictureTakenView
                        .onAppear{
                        self.recognizeCardText()
                    }
                }
                else {
                   ProgressView()
                }
            }
        }
    }
}

#Preview {
    TicketView()
}
