import Foundation

struct KataSolution {
    
    // Subsystem Classes
    
    enum NotificationType: String {
        case mail, message, pushNotification
    }
    
    protocol NotificationSender {
        var notificationType: NotificationType { get }
        func send(text: String) async throws
    }
    
    struct MailNotificationSender: NotificationSender {
        let notificationType: NotificationType = .mail
        
        func send(text: String) async throws {
            try await Task.sleep(nanoseconds: 100_000_000)
        }
    }
    
    struct MessageNotificationSender: NotificationSender {
        let notificationType: NotificationType = .message
        
        func send(text: String) async throws {
            try await Task.sleep(nanoseconds: 100_000_000)
        }
    }
    
    struct PushNotificationSender: NotificationSender {
        let notificationType: NotificationType = .pushNotification
        
        func send(text: String) async throws {
            try await Task.sleep(nanoseconds: 100_000_000)
        }
    }
    
    // Facade
    
    class NotificationFacade {
        typealias NotificationResult = Result<NotificationResponse, NotificationError>
        
        static func batchSend(text: String) async -> [NotificationResult] {
            var results: [NotificationResult] = []
            
            await withTaskGroup(of: NotificationResult.self) { group in
                group.addTask { await sendMail(text: text) }
                group.addTask { await sendMessage(text: text) }
                group.addTask { await sendPushNotification(text: text) }
                
                for await result in group {
                    results.append(result)
                }
            }
            
            return results
        }
        
        static func sendMail(text: String) async -> NotificationResult {
            let mailSender = MailNotificationSender()
            return await send(text: text, with: mailSender)
        }
        
        static func sendMessage(text: String) async -> NotificationResult {
            let messageSender = MessageNotificationSender()
            return await send(text: text, with: messageSender)
        }
        
        static func sendPushNotification(text: String) async -> NotificationResult {
            let pushNotificationSender = PushNotificationSender()
            return await send(text: text, with: pushNotificationSender)
        }
        
        private static func send(text: String, with sender: NotificationSender) async -> NotificationResult {
            do {
                try await sender.send(text: text)
                return .success(
                    NotificationResponse(
                        message: "Notification sent",
                        notificationType: sender.notificationType
                    )
                )
            }
            catch {
                return .failure(.failedToSend)
            }
        }
    }
    
    struct NotificationResponse {
        let message: String
        let notificationType: NotificationType
    }
    
    enum NotificationError: Error {
        case failedToSend
    }
}
