import Foundation

final class CallStation {
    var allUsers = Set<User>()
    var allCalls = Array<Call>()
}

extension CallStation: Station {
    func users() -> [User] {
        return Array(allUsers)
    }
    
    func add(user: User) {
        allUsers.insert(user)
    }
    
    func remove(user: User) {
        allUsers.remove(user)
    }
    
    func execute(action: CallAction) -> CallID? {
            nil
    }
    
    func calls() -> [Call] {
        return allCalls
    }
    
    func calls(user: User) -> [Call] {
        return allCalls.filter({ $0.incomingUser == user || $0.outgoingUser == user})
    }
    
    func call(id: CallID) -> Call? {
        return allCalls.first(where: { $0.id == id })
    }
    
    func currentCall(user: User) -> Call? {
        return allCalls.first(where: { ($0.status == .talk || $0.status == .calling) && ($0.incomingUser == user || $0.outgoingUser == user) })
    }
    
    func updateCall(new: Call) {
            if let index = calls().firstIndex(where: {$0.id == new.id} ) {
                allCalls.remove(at: index)
                allCalls.insert(new, at: index)
            }
        }
}
