//
//  ViewModel.swift
//  PoliServices
//
//  Created by Barbara Ann Pereira Lima on 30/01/23.
//

import Foundation

var 
private func setupService() {
let currentDate = Date()
let serviceDateInteger = UserDefaults.standard.integer(forKey: "service_date")
let serviceDate = Date(timeIntervalSince1970: TimeInterval(serviceDateInteger))
let hasService = serviceDate >= currentDate
if hasService {
    let serviceName = UserDefaults.standard.string(forKey: "service_name")

    serviceNameLabel.text = serviceName
    serviceDateLabel.text = serviceDate.formatted(
        date: .numeric,
        time: .shortened
    )
}else{
    UserDefaults.standard.removeObject(forKey: "service_date")
    UserDefaults.standard.removeObject(forKey: "service_name")
}

UIView.animate(withDuration: 0.3) {
    self.lastServiceView.alpha = hasService ? 1 : 0
    self.lastServiceView.isHidden = !hasService
    self.novoBtn.alpha = hasService ? 0 : 1
    self.novoBtn.isHidden = hasService
}

dateLabel.text = currentDate.formatted(
    date: .long,
    time: .omitted
)
}
