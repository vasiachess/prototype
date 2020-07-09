class AuthResponse {
  String jsonrpc;
  int id;
  Result result;

  AuthResponse({this.jsonrpc, this.id, this.result});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    jsonrpc = json['jsonrpc'];
    id = json['id'];
    result = json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jsonrpc'] = this.jsonrpc;
    data['id'] = this.id;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  String username;
  int maxTimeBetweenKeysInMs;
  int uid;
  String db;
  bool isAdmin;
  List<int> serverVersionInfo;
  String serverVersion;
  UserContext userContext;
  String webBaseUrl;
  String name;
  int partnerId;
  int companyId;
  String sessionId;
  bool isSuperuser;
  bool userCompanies;

  Result(
      {this.username,
      this.maxTimeBetweenKeysInMs,
      this.uid,
      this.db,
      this.isAdmin,
      this.serverVersionInfo,
      this.serverVersion,
      this.userContext,
      this.webBaseUrl,
      this.name,
      this.partnerId,
      this.companyId,
      this.sessionId,
      this.isSuperuser,
      this.userCompanies});

  Result.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    maxTimeBetweenKeysInMs = json['max_time_between_keys_in_ms'];
    uid = json['uid'];
    db = json['db'];
    isAdmin = json['is_admin'];
    serverVersionInfo = json['server_version_info'].cast<int>();
    serverVersion = json['server_version'];
    userContext = json['user_context'] != null ? new UserContext.fromJson(json['user_context']) : null;
    webBaseUrl = json['web.base.url'];
    name = json['name'];
    partnerId = json['partner_id'];
    companyId = json['company_id'];
    sessionId = json['session_id'];
    isSuperuser = json['is_superuser'];
    userCompanies = json['user_companies'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['max_time_between_keys_in_ms'] = this.maxTimeBetweenKeysInMs;
    data['uid'] = this.uid;
    data['db'] = this.db;
    data['is_admin'] = this.isAdmin;
    data['server_version_info'] = this.serverVersionInfo;
    data['server_version'] = this.serverVersion;
    if (this.userContext != null) {
      data['user_context'] = this.userContext.toJson();
    }
    data['web.base.url'] = this.webBaseUrl;
    data['name'] = this.name;
    data['partner_id'] = this.partnerId;
    data['company_id'] = this.companyId;
    data['session_id'] = this.sessionId;
    data['is_superuser'] = this.isSuperuser;
    data['user_companies'] = this.userCompanies;
    return data;
  }
}

class UserContext {
  String lang;
  String tz;
  int uid;

  UserContext({this.lang, this.tz, this.uid});

  UserContext.fromJson(Map<String, dynamic> json) {
    lang = json['lang'];
    tz = json['tz'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lang'] = this.lang;
    data['tz'] = this.tz;
    data['uid'] = this.uid;
    return data;
  }
}
