// user.dart
class User {
  final String username;
  final String imageUrl;
  final double balance;

  User({
    required this.username,
    required this.imageUrl,
    required this.balance,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'] ?? 'Guest',
      imageUrl: json['imageUrl'] ?? 'https://via.placeholder.com/150',
      balance: (json['balance'] ?? 0.0).toDouble(),
    );
  }
}
