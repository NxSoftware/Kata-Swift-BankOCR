import Foundation

class AccountsReport {
  
  class func read(_ path: URL) -> [String] {
    return AccountsFileReader.readEntries(path).map(decorate)
  }
  
  private class func decorate(entry: Entry) -> String {
    if entry.checksum == 0 {
      return entry.value
    } else {
      return "\(entry.value) ERR"
    }
  }
  
}
