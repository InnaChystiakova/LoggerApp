//
//  LoggerViewModel.swift
//  LoggerApp
//
//  Created by Inna Chystiakova on 06/09/2024.
//

import Foundation
import MobileLogginSDK

class LoggerViewModel: ObservableObject {
    @Published var resultFlag = false
    @Published var isHideImage = true
    @Published var resultMessage = ""
        
    func postMessage(text message: String) {
        
        let logger = MobileLogger()
        
        logger.logMessage(string: message){ result in
            self.handleResult(result: result)
        }
    }
    
    func postIncreasedMessageMessage(text message: String) {
        let logger = MobileLogger()
        
        logger.logMessageIfValid(string: message, minLen: 3){ result in
            self.handleResult(result: result)
        }
    }
    
    func postTrimmedMessage(text message: String) {
        
        let logger = MobileLogger()
        
        logger.logMessageIfValid(string: message, maxLen: 10){ result in
            self.handleResult(result: result)
        }
    }
    
    func postValidMessage(text message: String) {
        
        let logger = MobileLogger()
        let regex = "[A-Za-z0-9]+"
        
        logger.logMessageIfValidFormat(string: message, regex: regex){ result in
            self.handleResult(result: result)
        }
    }
    
    func postMultipleMessage(text messages: [String]) {
        
        let logger = MobileLogger()
        
        logger.logMultipleMessages(strings: messages){ result in
            self.handleResult(result: result)
        }
    }
    
    private func handleResult(result: MobileLoggerResult) {
        DispatchQueue.main.async {
            switch result {
            case .success:
                self.resultFlag = true
                self.resultMessage = "Success"
            case let .failure(errorDescription):
                self.resultFlag = false
                self.resultMessage = errorDescription
            }
            self.isHideImage = false
        }
    }
}
