//
//  TapToPay.swift
//  RetoBBVA
//
//  Created by Alumno on 24/04/24.
//
import SwiftUI
import CoreNFC

struct TapToPay: View {
    let bbvaBlue = Color(red: 0.00, green: 0.31, blue: 0.59)
    let instructionGrey = Color.gray
    @State var data = "" // Estado para almacenar datos NFC

    var body: some View {
        VStack {
            Text("$35.00 MXN")
                .font(.system(size: 50, weight: .bold, design: .default))
                .foregroundColor(bbvaBlue)
                .padding(.top, 20)
                .padding(.bottom, 0)  // Reduce espacio debajo del total

            Spacer().frame(height: 20)  // Espacio reducido entre el total y el recuadro

            VStack {
                Button(action: {
                    self.beginNFCRead()
                }) {
                    Image("images") // Imagen utilizada como botón NFC
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .padding(.top, 20)
                }

                Text("Acerca la tarjeta")
                    .font(.headline)
                    .foregroundColor(instructionGrey)
                    .padding(.bottom, 20)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(bbvaBlue, lineWidth: 2)
            )

            Text("Pago sin contacto")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(bbvaBlue)
                .padding(.bottom, 5)

            Spacer()
        }
        .background(Color.white)
        .padding()
        .navigationTitle("Tap to Pay")
        .navigationBarItems(leading: Button(action: {
            // Acción para botón de regreso
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(bbvaBlue)
        }, trailing: Image(systemName: "gear")
        .foregroundColor(bbvaBlue))
    }
    
    func beginNFCRead() {
        let coordinator = Coordinator(data: $data)
        coordinator.beginScan()
    }
}

extension TapToPay {
    class Coordinator : NSObject, NFCNDEFReaderSessionDelegate {
        var session : NFCNDEFReaderSession?
        @Binding var data: String
        
        init(data: Binding<String>) {
            _data = data
        }
        
        func beginScan() {
            guard NFCNDEFReaderSession.readingAvailable else {
                print("NFC Scanning not supported")
                return
            }
            
            session = NFCNDEFReaderSession(delegate: self, queue: .main, invalidateAfterFirstRead: true)
            session?.alertMessage = "Coloca tu iPhone para escanear"
            session?.begin()
        }
        
        func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
            print("Session invalidated: \(error.localizedDescription)")
            self.session = nil
        }
        
        func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
            guard let nfcMessage = messages.first,
                  let record = nfcMessage.records.first,
                  record.typeNameFormat == .absoluteURI || record.typeNameFormat == .nfcWellKnown,
                  let payload = String(data: record.payload, encoding: .utf8) else {
                return
            }
            self.data = payload
            print("NFC Data: \(payload)")
        }
    }
}

struct TapToPayView_Previews: PreviewProvider {
    static var previews: some View {
        TapToPay()
    }
}
