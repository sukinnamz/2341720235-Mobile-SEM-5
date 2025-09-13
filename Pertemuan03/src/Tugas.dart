void main() {
  for (int index = 0; index <= 201; index++) {
    bool prima = true;
    if (index == 0 || index == 1) {
      prima = false;
    } else if (index > 1) {
      for (int i = 2; i <= index / 2; i++) {
        if (index % i == 0) {
          prima = false;
          break;
        }
      }
    }

    if (prima) {
      print("$index - Innama Maesa Putri - 2341720235");
    } else {
      print("$index");
    }
  }
}
