struct Entry {
  let value: String
  let checksum: Int

  init(value: String) {
    self.value = value
    checksum = 0
  }
}
