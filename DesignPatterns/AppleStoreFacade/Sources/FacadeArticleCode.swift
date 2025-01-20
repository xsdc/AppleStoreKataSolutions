
struct Article {
    
    // Facade
    
    class NotificationFacade {
        enum NotificationType {
            case mail, message
        }
        
        private(set) var notificationType: NotificationType
        private let mailNotificationAPI = MailNotificationAPI()
        private let messageNotificationAPI = MessageNotificationAPI()
        
        init(notificationType: NotificationType) {
            self.notificationType = notificationType
        }

        func send(text: String) {
            switch notificationType {
            case .mail:
                mailNotificationAPI.sendMail(text: text)
            case .message:
                messageNotificationAPI.sendMessage(text: text)
            }
        }
    }
    
    // Subsystem Classes

    struct MailNotificationAPI {
        func sendMail(text: String) {
            print("Mail sent with text: \(text)")
        }
    }

    struct MessageNotificationAPI {
        func sendMessage(text: String) {
            print("Message sent with text: \(text)")
        }
    }
}
