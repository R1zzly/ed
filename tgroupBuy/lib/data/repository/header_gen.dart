class HeaderGen {
  Map<String, String> getHeader() {
    return {'Content-Type': 'application/json'};
  }

  Map<String, String> getHeaderWithToken(String token) {
    return {
      'Content-Type': 'application/json',
      'token': token
    };
  }
}
