class AsyncResponse {
  final Exception? exception;
  final bool isSuccess;
  final String title;
  final String? body;

  AsyncResponse(
      {this.exception, this.isSuccess = false, required this.title, this.body});
}
