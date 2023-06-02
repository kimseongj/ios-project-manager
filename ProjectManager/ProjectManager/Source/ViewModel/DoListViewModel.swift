//
//  MainViewModel.swift
//  ProjectManager
//
//  Created by songjun, vetto on 2023/05/23.
//

import Foundation
import Combine

final class DoListViewModel {
    let scheduleManager = ScheduleManager.shared
    @Published var scheduleList: [Schedule] = []
    private var cancelBag: Set<AnyCancellable> = []
    
    init(scheduleType: ScheduleType) {
        fetchSchedule(scheduleType: scheduleType)
    }
    
    private func fetchSchedule(scheduleType: ScheduleType) {
        scheduleManager.sendSchedule(scheduleType: scheduleType).assign(to: \.scheduleList, on: self).store(in: &cancelBag)
    }
    
    func deleteSchedule(scheduleType: ScheduleType, index: Int) {
        scheduleManager.deleteSchedule(scheduleType: scheduleType, index: index)
    }
    
    func move(fromIndex: Int, from: ScheduleType, to: ScheduleType) {
        scheduleManager.move(fromIndex: fromIndex, from: from, to: to)
    }
}
