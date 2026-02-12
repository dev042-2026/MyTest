import SwiftUICore
import SwiftUI

struct BerlinClockView: View {
    
    @StateObject private var berlinClockViewModel = BerlinClockViewModel()
    
    @State private var hoursInput: String = ""
    @State private var minutesInput: String = ""
    @State private var secondsInput: String = ""
    
    var body: some View {
        
        VStack(spacing: 20){
            
            Text("Berlin Clock")
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
            
            // Live Clock Section
            BerlinLiveClockView(berlinClockViewModel: berlinClockViewModel)
            
            Divider()
                .padding(.vertical, 5)
            
            // Custom Clock Section
            BerlinCustomClockView(berlinClockViewModel: berlinClockViewModel)
            Spacer()
        }
    }
}

#Preview {
    BerlinClockView()
}
