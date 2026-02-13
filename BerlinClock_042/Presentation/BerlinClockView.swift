import SwiftUI

struct BerlinClockView: View {
    
    @StateObject private var berlinClockViewModel = BerlinClockViewModel()
    
    @State private var hoursInput: String = ""
    @State private var minutesInput: String = ""
    @State private var secondsInput: String = ""
    
    var body: some View {
        
        NavigationStack  {
            ScrollView {
                VStack(spacing: 20){
                    
                    // Live Clock Section
                    BerlinLiveClockView(berlinClockViewModel: berlinClockViewModel, onStart: resetFields)
                    
                    Divider()
                        .padding(.vertical, 5)
                    
                    // Custom Clock Section
                    BerlinCustomClockView(berlinClockViewModel: berlinClockViewModel,
                                          hoursInput: $hoursInput,
                                          minutesInput: $minutesInput,
                                          secondsInput: $secondsInput)
                    Spacer()
                }
            }
            .navigationTitle("Berlin Clock")
            .toolbarBackground(Color.blue, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .padding(20)
            .scrollDismissesKeyboard(.interactively)
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
    }
    
    private func resetFields() {
        hoursInput = ""
        minutesInput = ""
        secondsInput = ""
    }
}

#Preview {
    BerlinClockView()
}
