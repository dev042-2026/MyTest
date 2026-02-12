
import SwiftUI

struct BerlinCustomClockView: View {
    
    @ObservedObject var berlinClockViewModel: BerlinClockViewModel
    
    @State private var hoursInput: String = ""
    @State private var minutesInput: String = ""
    @State private var secondsInput: String = ""
    
    var body: some View {
        VStack(spacing: 25) {
            
            Text("Berlin clock with Custom Time")
                .font(.headline)
            
            HStack(spacing: 10) {
                TextField("HH", text: $hoursInput)
                    .frame(width: 50, height: 50)
                    .border(Color.gray, width: 1)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                
                TextField("MM", text: $minutesInput)
                    .frame(width: 50, height: 50)
                    .border(Color.gray, width: 1)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                
                TextField("SS", text: $secondsInput)
                    .frame(width: 50, height: 50)
                    .border(Color.gray, width: 1)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                
                Spacer()
                Button("Display") {
                    berlinClockViewModel.convert(
                        hoursText: hoursInput,
                        minutesText: minutesInput,
                        secondsText: secondsInput
                    )
                }
                .buttonStyle(.borderedProminent)
                .frame(width: 150, height: 50)
            }
        }
        .padding(.horizontal)
        
        .alert("Error", isPresented: .constant(berlinClockViewModel.errorMessage != nil)) {
            Button("OK") { berlinClockViewModel.errorMessage = nil }
        } message: {
            Text(berlinClockViewModel.errorMessage ?? "")
        }
    }
}
