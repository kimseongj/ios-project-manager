//
//  ScheduleManager.swift
//  ProjectManager
//
//  Created by songjun, vetto on 2023/05/31.
//

import Foundation
import Combine

class ScheduleManager {
    static let shared = ScheduleManager()
    
    @Published var todoSchedules: [Schedule] = []
    @Published var doingSchedules: [Schedule] = []
    @Published var doneSchedules: [Schedule] = []
    
    func sendTodoSchedules() -> AnyPublisher<[Schedule], Never> {
        return $todoSchedules.eraseToAnyPublisher()
    }
    
    func sendDoingSchedules() -> AnyPublisher<[Schedule], Never> {
        return $doingSchedules.eraseToAnyPublisher()
    }
    
    func sendDoneSchedules() -> AnyPublisher<[Schedule], Never> {
        return $doneSchedules.eraseToAnyPublisher()
    }
    
    func addTodoSchedule(_ schedule: Schedule) {
        todoSchedules.append(schedule)
    }

    
    func deleteSchedule(scheduleType: ScheduleType, index: Int) {
        switch scheduleType {
        case .todo:
            todoSchedules.remove(at: index)
        case .doing:
            doingSchedules.remove(at: index)
        case .done:
            doneSchedules.remove(at: index)
        }
    }
    
    func fetchSchedule(scheduleType: ScheduleType) -> [Schedule] {
        switch scheduleType {
        case .todo:
            return todoSchedules
        case .doing:
            return doingSchedules
        case .done:
            return doneSchedules
        }
    }
    
    func updateSchedule(scheduleType: ScheduleType, schedule: Schedule, index: Int) {
        switch scheduleType {
        case .todo:
            todoSchedules[index] = schedule
        case .doing:
            doingSchedules[index] = schedule
        case .done:
            doneSchedules[index] = schedule
        }
    }
    
    func count(scheduleType: ScheduleType) -> Int {
        switch scheduleType {
        case .todo:
            return todoSchedules.count
        case .doing:
            return doingSchedules.count
        case .done:
            return doneSchedules.count
        }
    }
    
    func move(fromIndex: Int, from: ScheduleType, to: ScheduleType) {
        var schedule: Schedule
        
        switch from {
        case .todo:
            schedule = todoSchedules.remove(at: fromIndex)
        case .doing:
            schedule = doingSchedules.remove(at: fromIndex)
        case .done:
            schedule = doneSchedules.remove(at: fromIndex)
        }
        
        switch to {
        case .todo:
            todoSchedules.append(schedule)
        case .doing:
            doingSchedules.append(schedule)
        case .done:
            doneSchedules.append(schedule)
        }
    }
}
