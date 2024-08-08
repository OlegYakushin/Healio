//
//  SetUpdailyView.swift
//  Healio
//
//  Created by Oleg Yakushin on 7/1/24.
//
import SwiftUI
import UserNotifications

struct SetUpdailyView: View {
    @State private var isOne = true
    @State private var isTwo = true
    @State private var showTimePickerOne = false
    @State private var showTimePickerTwo = false
    @State private var reminderTimeOne: Date = loadReminderTime(forKey: "reminderTimeOne") ?? Calendar.current.date(from: DateComponents(hour: 8, minute: 0)) ?? Date()
    @State private var reminderTimeTwo: Date = loadReminderTime(forKey: "reminderTimeTwo") ?? Calendar.current.date(from: DateComponents(hour: 22, minute: 0)) ?? Date()
    @State private var navigateToNextView = false

    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                VStack(alignment: .leading) {
                    Text("Set up your daily\nreminders.")
                        .font(.custom("AveriaSerifLibre-Light", size: 34 * sizeScreen()))
                        .kerning(-1.2)
                        .foregroundColor(Color("fontDark"))
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 20 * sizeScreen())
                    Text("Consistent practice helps embed the affirmations into your subconscious mind.")
                        .font(.custom("AvertaDemoPE-Regular", size: 16 * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal, 20 * sizeScreen())
                Image("notifImage")
                    .resizable()
                    .frame(width: 375 * sizeScreen(), height: 160 * sizeScreen())
                    .padding(.top, 20 * sizeScreen())
                reminderToggleView(time: $reminderTimeOne, isOn: $isOne, showTimePicker: $showTimePickerOne, key: "reminderTimeOne")
                reminderToggleView(time: $reminderTimeTwo, isOn: $isTwo, showTimePicker: $showTimePickerTwo, key: "reminderTimeTwo")
                    .padding(.top, 20 * sizeScreen())
                Spacer()
                VStack(spacing: 0) {
                    NavigationLink(destination: PerosonaView().navigationBarBackButtonHidden(), isActive: $navigateToNextView) {
                        EmptyView()
                    }
                    ButtonView(name: "Continue")
                        .onTapGesture{
                            requestNotificationPermission()
                            checkAndScheduleNotifications()
                            navigateToNextView = true
                        }
                    NavigationLink(destination: PerosonaView().navigationBarBackButtonHidden()) {
                        Text("Not now")
                            .foregroundColor(Color("fontDark"))
                            .font(.custom("Averta-Bold", size: 16 * sizeScreen()))
                            .frame(height: 62 * sizeScreen())
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
            }
    }

    private func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification permission granted.")
            } else {
                print("Notification permission denied.")
            }
        }
    }

    private func checkAndScheduleNotifications() {
        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
            let ids = requests.map { $0.identifier }
            if isOne {
                if !ids.contains("reminderTimeOne") {
                    scheduleNotification(for: reminderTimeOne, message: "Good morning! Start your day with positivity and healing energy.", identifier: "reminderTimeOne")
                }
            } else {
                removeNotification(identifier: "reminderTimeOne")
            }
            if isTwo {
                if !ids.contains("reminderTimeTwo") {
                    scheduleNotification(for: reminderTimeTwo, message: "Good evening! End your day with positivity and healing energy.", identifier: "reminderTimeTwo")
                }
            } else {
                removeNotification(identifier: "reminderTimeTwo")
            }
        }
    }

    private func scheduleNotification(for date: Date, message: String, identifier: String) {
        let content = UNMutableNotificationContent()
        content.title = "Daily Affirmation"
        content.body = message
        content.sound = .default

        var dateComponents = Calendar.current.dateComponents([.hour, .minute], from: date)
        dateComponents.second = 0
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error adding notification: \(error.localizedDescription)")
            }
        }
    }

    private func removeNotification(identifier: String) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
    }
}

#Preview {
    SetUpdailyView()
}

func saveReminderTime(_ date: Date, forKey key: String) {
    let defaults = UserDefaults.standard
    defaults.set(date, forKey: key)
}

func loadReminderTime(forKey key: String) -> Date? {
    let defaults = UserDefaults.standard
    return defaults.object(forKey: key) as? Date
}
