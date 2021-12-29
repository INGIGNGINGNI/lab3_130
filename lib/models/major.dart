class Major {
  String? thName;
  String? enName;
  String? majorvalue;

  Major(this.enName, this.thName, this.majorvalue);

  static List<Major> getmajor() {
    return [
      Major('Computer Science', 'วิทยาการคอมพิวเตอร์', 'CS'),
      Major('Information Technology', 'เทคโนโลยีสารสนเทศ', 'IT'),
    ];
  }
}
