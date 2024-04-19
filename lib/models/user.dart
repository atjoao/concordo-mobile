class Friends {
  // i know how to name variables
  final List<String> user;
  final List<String> requests;
  final List<String> sentRequests;

  Friends(this.user, this.requests, this.sentRequests);
}

class UserInfo {
  final String username;
  final String email;
  final String id;
  final String descrim;
  final String avatar;

  final List<String> blockList;
  final Friends friends;

  UserInfo(this.username, this.email, this.id, this.descrim, this.avatar,
      this.blockList, this.friends);
}
