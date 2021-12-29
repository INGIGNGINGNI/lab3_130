class Lecturer {
  String? thName;
  String? enName;
  bool? checked;

  Lecturer(this.thName, this.enName, this.checked);

  static List<Lecturer> getlecturer() {
    return [
      Lecturer('อาจารย์ ดร.ณภัทร แก้วภิบาล', 'Naphat Kaewpiban', false),
      Lecturer('อาจารย์ ดร.คณิดา สินใหม', 'Kanida Sinmai', false),
      Lecturer('ผู้ช่วยศาสตราจารย์สุดา เธียรมนตรี', 'Suda Thianmontri', false),
      Lecturer(
          'ผู้ช่วยศาสตราจารย์อรยา ปรีชาพานิช', 'Oraya Preechapanich', false),
      Lecturer('อาจารย์ ดร.สุวิมล จุงจิตร์', 'Suwimol Jungjit', false),
      Lecturer('อาจารย์ ดร.นิชากรณ์ พันธ์คง', 'Nichakorn Pankong', false),
    ];
  }
}
