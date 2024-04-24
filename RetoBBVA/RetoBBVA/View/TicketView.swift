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
                let recognizedText = observation.topCandidates(1).first!.string
                //self.recognizedTexts.append(recognizedText)
                
                if (recognizedText.contains("$")){ // o cambiarlo que sea algo con  total
                    self.recognizedTexts.append(recognizedText)
                 }
                print(recognizedTexts)
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
            Button(action: { 
                self.imageTaken = nil
                self.recognizedTexts = [String]()
            }, label: {
                HStack{
                    Image(systemName: "camera")
                    Text("Re-take picture")
                }
            })
            
            // Display info
            //Text(recognizedTexts)
            List {
                ForEach(self.recognizedTexts, id: \.self) {
                    Text ("\($0)")
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

