class AppUtils {
  static String getTransactionableType(String type) {
    List splittedString = type.split('\\');
    if (splittedString.length >= 3) {
      if (splittedString[2] == 'Send' || splittedString[2] == 'Receive')
        return 'Money Transfer';
      return splittedString[2];
    }
    return type;
  }
}
