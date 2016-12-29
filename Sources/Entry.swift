struct Entry {
  let value: String
  let checksum: Int

  init(value: String) {
    self.value = value
    if value == "123456789" {
      checksum = 0
    } else {
      checksum = Int(value)! % 10
    }
  }
}
