extension MapUtils on Map<String, String> {
  String enqueueQueryParams() {
    if (isEmpty) {
      return "";
    } else {
      String result = "";
      int queryParamCounter = 0;
      for (final entry in entries) {
        result += queryParamCounter == 0
            ? "?${entry.key}=${entry.value}"
            : "&${entry.key}=${entry.value}";
        queryParamCounter++;
      }
      return result;
    }
  }
}
