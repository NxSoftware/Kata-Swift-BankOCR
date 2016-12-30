import Foundation

class AccountsReport {
  
  class func read(_ path: URL) -> [String] {
    return AccountsFileReader.readEntries(path).map(decorate)
  }
  
  private class func decorate(entry: Entry) -> String {
    var result = entry.value
    if entry.checksum != 0 {
      result += " ERR"
    }
    return result
  }
  
}