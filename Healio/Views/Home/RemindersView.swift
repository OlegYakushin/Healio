import SwiftUI

import SwiftUI
import UserNotifications

struct RemindersView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isOne = true
    @State private var isTwo = true
    @State private var showTimePickerOne = false
    @State private var showTimePickerTwo = false
    
    @State private var reminderTimeOne: Date = loadReminderTime(forKey: "reminderTimeOne") ?? Calendar.current.date(from: DateComponents(hour: 8, minute: 0)) ?? Date()
    @State private var reminderTimeTwo: Date = loadReminderTime(forKey: "reminderTimeTwo") ?? Calendar.current.date(from: DateComponents(hour: 22, minute: 0)) ?? Date()
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                VStack {
                    ZStack {
                        HStack {
                            Image("backButton")
                                .resizable()
                                .frame(width: 20 * sizeScreen(), height: 20 * sizeScreen())
                                .onTapGesture {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            Spacer()
                        }
                        Text("Settings")
                            .foregroundColor(Color("fontDark"))
                            .font(.custom("Averta-Semibold", size: 16 * sizeScreen()))
                    }
                    HStack {
                        Text("Reminders")
                            .foregroundColor(Color("fontDark"))
                            .font(.custom("AveriaSerifLibre-Light", size: 40 * sizeScreen()))
                        Spacer()
                    }
                    
                    reminderToggleView(time: $reminderTimeOne, isOn: $isOne, showTimePicker: $showTimePickerOne, key: "reminderTimeOne")
                    reminderToggleView(time: $reminderTimeTwo, isOn: $isTwo, showTimePicker: $showTimePickerTwo, key: "reminderTimeTwo")
                        .padding(.top, 20 * sizeScreen())
                    
                    Spacer()
                }
                .padding(.top, 10 * sizeScreen())
                .padding(.horizontal, 15 * sizeScreen())
            }
        }
        .sheet(isPresented: $showTimePickerOne) {
            if #available(iOS 16.0, *) {
                TimePickerOverlay(selectedTime: $reminderTimeOne, isPresented: $showTimePickerOne)
                    .presentationDetents([.fraction(3.8 / 7)])
            } else {
                TimePickerOverlay(selectedTime: $reminderTimeOne, isPresented: $showTimePickerOne)
            }
        }
        .sheet(isPresented: $showTimePickerTwo) {
            if #available(iOS 16.0, *) {
                TimePickerOverlay(selectedTime: $reminderTimeTwo, isPresented: $showTimePickerTwo)
                    .presentationDetents([.fraction(3.8 / 7)])
            } else {
                TimePickerOverlay(selectedTime: $reminderTimeTwo, isPresented: $showTimePickerTwo)
            }
        }
    }
    
    private func reminderToggleView(time: Binding<Date>, isOn: Binding<Bool>, showTimePicker: Binding<Bool>, key: String) -> some View {
        RoundedRectangle(cornerRadius: 24 * sizeScreen())
            .stroke(Color.white, lineWidth: 2 * sizeScreen())
            .frame(width: 327 * sizeScreen(), height: 74 * sizeScreen())
            .background(Color.white.opacity(0.4).cornerRadius(24 * sizeScreen()))
            .overlay(
                HStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color("lightOne"))
                        .frame(width: 83 * sizeScreen(), height: 50 * sizeScreen())
                        .overlay(
                            Text(dateFormatter.string(from: time.wrappedValue))
                                .font(.custom("Avenir-Heavy", size: 16 * sizeScreen()))
                                .foregroundColor(Color("fontDark"))
                                .onTapGesture {
                                    showTimePicker.wrappedValue.toggle()
                                }
                        )
                    Spacer()
                    Toggle(isOn: isOn) {}
                        .toggleStyle(CustomToggleStyle())
                }
                .padding(.horizontal, 20 * sizeScreen())
            )
            .onChange(of: time.wrappedValue) { newValue in
                saveReminderTime(newValue, forKey: key)
                rescheduleNotification(for: newValue, withKey: key, message: key == "reminderTimeOne" ? "Good morning! Start your day with positivity and healing energy." : "Good evening! End your day with positivity and healing energy.")
            }
    }
    
    private func rescheduleNotification(for date: Date, withKey key: String, message: String) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [key])
        
        let content = UNMutableNotificationContent()
        content.title = "Daily Affirmation"
        content.body = message
        content.sound = .default
        
        var dateComponents = Calendar.current.dateComponents([.hour, .minute], from: date)
        dateComponents.second = 0
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: key, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error adding notification: \(error.localizedDescription)")
            }
        }
    }
}

struct TimePickerOverlay: View {
    @Binding var selectedTime: Date
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color("backgroundColor")
                .ignoresSafeArea()
            VStack {
                Image("overlayImage")
                    .resizable()
                    .frame(width: 34 * sizeScreen(), height: 5 * sizeScreen())
                    .padding()
                HStack {
                    Text("Choose a time")
                        .foregroundColor(Color("fontDark"))
                        .font(.custom("AveriaSerifLibre-Light", size: 26 * sizeScreen()))
                        .padding(.horizontal, 10)
                    Spacer()
                }
                DatePicker("Choose a time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                ButtonView(name: "Done")
                    .onTapGesture {
                        isPresented = false
                    }
                    .padding()
            }
        }
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter
}()

#Preview {
    RemindersView()
}
