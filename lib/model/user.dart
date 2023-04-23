class User {
  String name;
  String email;
  String amount;

  User({required this.name, required this.email, required this.amount});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'amount': amount,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      email: map['email'],
      amount: map['amount'],
    );
  }
}
