class Suit {
  final String? name;
  final String? text;
  final int? amount;
  final String? due;

  //state booleans
  final bool? expired;
  final bool? paid;

  Suit(this.paid, {this.name, this.text, this.amount, this.due, this.expired});
}
