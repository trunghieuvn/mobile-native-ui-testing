//
//  ContentView.swift
//  helloswift
//
//  Created by MacBook Pro on 11/21/21.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @State private var text = "Hello"
    @EnvironmentObject var vm: ViewModel
    private let locationManager = CLLocationManager()

    var body: some View {
        
        NavigationView {
            VStack {
                if let image = vm.image {
                    ZoomableScrollView {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                        .frame(minWidth: 0, maxWidth: .infinity)
                    }
                } else {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.6)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.horizontal)
                }
                HStack {
                    Button {
                        vm.source = .camera
                        vm.showPhotoPicker()
                    } label: {
                        Text("Camera")
                    }
                    Button {
                        vm.source = .library
                        vm.showPhotoPicker()
                    } label: {
                        Text("Photos")
                    }
                }
                Spacer()
                VStack {
                    Text(self.text)
                        .padding()
                    Button(
                        action: {
                            self.text = "World"
                    }) {
                        Text("Click")
                    }
                    .accessibilityIdentifier("btnClick")
                }
                Spacer()
            }
            .sheet(isPresented: $vm.showPicker) {
                ImagePicker(sourceType: vm.source == .library ? .photoLibrary : .camera, selectedImage: $vm.image)
                    .ignoresSafeArea()
            }
            .navigationTitle("UI Testing")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
            .environmentObject(ViewModel())
            
    }
}


class ViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var showPicker = false
    @Published var source: Picker.Source = .library
    
    func showPhotoPicker() {
        if source == .camera {
            if !Picker.checkPermissions() {
                print("There is no camera on this device")
                return
            }
        }
        showPicker = true
    }
}

class LocationModel: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    @Published var authorisationStatus: CLAuthorizationStatus = .notDetermined

    override init() {
        super.init()
        self.locationManager.delegate = self
    }

    public func requestAuthorisation(always: Bool = false) {
        if always {
            self.locationManager.requestAlwaysAuthorization()
        } else {
            self.locationManager.requestWhenInUseAuthorization()
        }
    }
}

extension LocationModel: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.authorisationStatus = status
    }
}
