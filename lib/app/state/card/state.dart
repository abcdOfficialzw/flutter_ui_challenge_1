class CardStackState {
  final bool isRotated;
  final bool showScrollBar;
  final int
      numberOfCards; // Assuming cards are represented as strings for simplicity

  CardStackState(
      {this.isRotated = false,
      this.showScrollBar = false,
      this.numberOfCards = 6});

  CardStackState copyWith(
      {bool? isRotated, bool? showScrollBar, int? numberOfCards}) {
    return CardStackState(
      isRotated: isRotated ?? this.isRotated,
      showScrollBar: showScrollBar ?? this.showScrollBar,
      numberOfCards: numberOfCards ?? this.numberOfCards,
    );
  }
}
