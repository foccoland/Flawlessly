class Result<Success, Err> {
  Success? success;
  Err? error;

  Result({this.success, this.error});
}
