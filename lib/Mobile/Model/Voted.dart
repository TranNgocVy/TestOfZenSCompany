class Voted {
  final int id;
  final int jokeId;
  final int voted;
  final String userCookie ;
  final DateTime votedDay;

  const Voted({
    required this.id,
    required this.jokeId,
    required this.voted,
    required this.userCookie,
    required this.votedDay,

  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'joke_id': jokeId,
      'voted': voted,
      'user_cookie': userCookie,
      'voted_day': votedDay.toString(),
    };
  }

  @override
  String toString() {
    return 'Voted{id: $id, jokeId: $jokeId, voted: $voted, userCookie: $userCookie, votedDay: $votedDay}';
  }
}