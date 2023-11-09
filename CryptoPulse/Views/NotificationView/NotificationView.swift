//
//  NotificationView.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 27/11/2023.
//

import SwiftUI

struct NotificationView: View {
    @EnvironmentObject var notificationData: NotificationData
    @State var buttonText: String = "Add Alert"
    @State private var showNextView: Bool = false
    @Binding var notificaations: [NotifiacationModel]
    var updateNotifications: () -> Void
    let width: CGFloat = 35
    let height: CGFloat = 30
    
    var body: some View {
        VStack {
            HStack {
                headerView
                NavigationLink(destination: NotificationCoinsView()) {
                    CircleButtonView(width: width, height: height)
                        .padding(.trailing)
                        .opacity(notificaations.isEmpty ? 0 : 1)
                }
            }
            if notificationData.notifications.isEmpty {
                imageView
                    .padding(.top, 150)
                Spacer()
                NavigationLink(destination: NotificationCoinsView()) {
                    Text("Add Alert")
                        .font(.headline)
                        .foregroundStyle(Color.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.theme.backgroundColor)
                        .padding(.horizontal)
                        .padding(.bottom)
                }
                
            } else {
                List {
                    ForEach(notificationData.notifications) { notification in
                        NotificationRowView(notifications: notification)
                    }
                    .listRowSeparator(.visible)
                    .listRowBackground(Color.accentColor)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("")
        .toolbar(.hidden)
    }
    func addNewNotification(notification: NotifiacationModel) {
            notificaations.append(notification)
        }
}

struct NotificationView_previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ZStack {
                Color.accentColor.ignoresSafeArea()
                NotificationView( notificaations: .constant([]), updateNotifications: { })
            }
        }
    }
}

extension NotificationView {
    private var headerView: some View {
        HStack {
            Image(systemName: "arrow.backward")
                .font(.headline)
                .foregroundColor(Color.theme.secondaryText)
                .padding(.leading)
              Spacer()
            Text("Notification Alert")
                .font(.headline)
                .foregroundColor(.white)
            Spacer()
        }
    }
    
    private var imageView: some View {
        VStack {
            Image(systemName: "doc.text.magnifyingglass")
                .font(.system(size: 80))
                .lineLimit(1)
                .foregroundStyle(Color.theme.secondaryText)
            Text("No records found")
                .font(.title)
                .foregroundStyle(Color.theme.secondaryText)
        }
    }
}
