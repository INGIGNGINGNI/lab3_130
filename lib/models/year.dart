class Year {
  String? number;
  String? yearvalue;

  Year(this.number, this.yearvalue);

  static List<Year> getyear() {
    return [
      Year('1', '1'),
      Year('2', '2'),
      Year('3', '3'),
      Year('4', '4'),
    ];
  }
}
