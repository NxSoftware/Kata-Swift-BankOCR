import Foundation

class AccountsReport {
  
  class func read(_ path: URL) -> [String] {
    return AccountsFileReader.readEntries(path).map { entry in
      if entry.checksum == 0 {
        return entry.value
      } else {
        return "\(entry.value) ERR"
      }
    }
  }
  
}
