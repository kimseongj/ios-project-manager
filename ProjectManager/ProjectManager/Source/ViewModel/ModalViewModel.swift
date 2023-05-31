//
//  ModalViewController.swift
//  ProjectManager
//
//  Created by kimseongjun on 2023/05/31.
//

import Foundation

final class ModalViewModel {
    let scheduleManager = ScheduleManager.shared
    
    func addTodoSchedule(_ schedule: Schedule) {
        scheduleManager.addTodoSchedule(schedule)
    }
    
    func createSchedule(titleText: String?, contentText: String?, expirationDate: Date) -> Schedule {
        guard let validTitleText = titleText, let validContentText = contentText else {
            return Schedule()
        }
        
        let schedule = Schedule(title: validTitleText, content: validContentText, expirationDate: expirationDate)
        
        return schedule
    }
    
    func fetchSchedule(scheduleType: ScheduleType) -> [Schedule] {
        return scheduleManager.fetchSchedule(scheduleType: scheduleType)
    }
    
    func updateSchedule(scheduleType: ScheduleType, schedule: Schedule, index: Int) {
        scheduleManager.updateSchedule(scheduleType: scheduleType, schedule: schedule, index: index)
    }
}
