enum HttpMethod {
  get("GET"),
  put("PUT"),
  post("POST"),
  delete("DELETE"),
  patch("PATCH");

  final String value;

  const HttpMethod(this.value);
}
