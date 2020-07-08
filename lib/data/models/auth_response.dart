class AuthResponse {
  int id;
  String sessionId;

  AuthResponse({this.id, this.sessionId});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sessionId = json['session_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['session_id'] = this.sessionId;
    return data;
  }
}