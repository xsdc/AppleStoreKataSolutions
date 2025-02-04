import Foundation

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
    
    static func sendMail(text: String) async -> NotificationResult {
        // Task 1: Add the implementation for sending mail notifications
        return .failure(.failedToSend)
    }
    
    static func sendMessage(text: String) async -> NotificationResult {
        // Task 2: Add the implementation for sending message notifications
        return .failure(.failedToSend)
    }
    
    static func sendPushNotification(text: String) async -> NotificationResult {
        // Task 3: Add the implementation for sending push notifications
        return .failure(.failedToSend)
    }
    
    static func batchSend(text: String) async -> [NotificationResult] {
        // Task 4: Add the implementation for sending all notification types
        return [
            .failure(.failedToSend)
        ]
    }
}

struct NotificationResponse {
    let message: String
    let notificationType: NotificationType
}

enum NotificationError: Error {
    case failedToSend
}
