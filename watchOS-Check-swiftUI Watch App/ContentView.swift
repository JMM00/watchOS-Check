//
//  ContentView.swift
//  watchOS-Check-swiftUI Watch App
//
//  Created by 전지민 on 2022/09/21.
//

import SwiftUI
import UIKit
import UserNotifications

struct ContentView: View {
    @State var gotoStretchView = false
    var body: some View {
        NavigationView {
            VStack(spacing: 10){
                Image(systemName: "figure.cooldown")
                    .font(.system(size: 44))
                    .padding(.top, 20)
                Text("집중하는것도 좋지만\n간단하게 몸을 움직여봐요!")
                    .font(.system(size: 18))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    
                Button {
//                    setNotification()
                    notiSet()
                    gotoStretchView = true
                    print("버튼 클릭")

                } label: {
                    Text("스트레칭 시작하기")
                        .font(.system(size: 19))
//                        .fontWeight(.bold)
                }
                .padding(.top)
                .buttonStyle(.borderedProminent)
                .tint(Color.mainColor)
                .foregroundColor(Color.white)
                .background(
                    NavigationLink(
                        destination: StretchView(),
                        isActive: $gotoStretchView,
                        label: {EmptyView()}
                    )
                )
            }
            .onAppear{getNotificationPermission()}
        }
    }
    func getNotificationPermission() -> Void {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
            // Enable or disable features based on the authorization.
        }
    }
    func setNotification(){
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "hello", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Hello_message_body", arguments: nil)
        content.sound = UNNotificationSound.default
         
        // Deliver the notification in five seconds.
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "FiveSecond", content: content, trigger: trigger) // Schedule the notification.
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error : Error?) in
            
             if let theError = error {
                 // Handle any errors
             }
        }
    }
    func notiSet() -> Void{
        print("notiSet")
        let content = UNMutableNotificationContent()
        content.title = "Feed the cat"
        content.subtitle = "It looks hungry"
        content.sound = UNNotificationSound.default

        // show this notification five seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
