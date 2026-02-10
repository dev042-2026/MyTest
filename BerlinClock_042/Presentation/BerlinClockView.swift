import SwiftUICore
import SwiftUI

struct BerlinClockView: View {
    
    @StateObject private var berlinClockViewModel = BerlinClockViewModel()
    
    @State private var hoursInput: String = ""
    @State private var minutesInput: String = ""
    @State private var secondsInput: String = ""
    
    var body: some View {
            
        VStack(spacing: 50){
            
            Text("Berlin Clock")
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
            
            HStack(spacing: 10) {
                
                TextField("HH", text: $hoursInput)
                    .frame(width: 50, height: 50, alignment: .center)
                    .border(Color.gray, width: 1)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                
                TextField("MM", text: $minutesInput)
                    .frame(width: 50, height: 50, alignment: .center)
                    .border(Color.gray, width: 1)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                
                TextField("SS", text: $secondsInput)
                    .frame(width: 50, height: 50)
                    .border(Color.gray, width: 1)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button("Display Berlin Clock") {}
                    .frame(width: 180, height: 50)
                    .border(Color.white, width: 1)
                    .buttonStyle(.borderedProminent)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue))
            
            } .padding(.horizontal)
            Spacer()
        }
    }
}

#Preview {
    BerlinClockView()
}
