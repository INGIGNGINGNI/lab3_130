import 'package:flutter/material.dart';
import 'package:lab3_130/models/lecturer.dart';
import 'package:lab3_130/models/major.dart';
import 'package:lab3_130/models/year.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  String? yearValue;
  String? majorValue;

  late List<Year> years;
  late List<Major> majors;
  late List<Faculty> dropdownItems = Faculty.getlistItem();
  late List<DropdownMenuItem<Faculty>> dropdownMenuItems;
  late List<Lecturer> lecturers;
  late Faculty _selectedFaculty;

  List selectLecturer = [];

  @override
  void initState() {
    super.initState();
    years = Year.getyear();
    majors = Major.getmajor();
    dropdownMenuItems = createDropdownMenu(dropdownItems);
    _selectedFaculty = dropdownMenuItems[0].value!;
    lecturers = Lecturer.getlecturer();
  }

  List<DropdownMenuItem<Faculty>> createDropdownMenu(
      List<Faculty> dropdownItems) {
    List<DropdownMenuItem<Faculty>> facultys = [];

    for (var faculty in dropdownItems) {
      facultys.add(
        DropdownMenuItem(
          child: Text(faculty.fname!),
          value: faculty,
        ),
      );
    }
    return facultys;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  maintitle(),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  name(),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  studentID(),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  yearclasstxt(),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  yearradiobtn(),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  majortxt(),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  majorradiobtn(),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  facultytxt(),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  dropdownbtn(),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  lecturertxt(),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  checkbox(),
                  savebtn(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget savebtn() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            print(_usernamecontroller.text);
            print(_passwordcontroller.text);
          }
          return null;
        },
        child: const Text(
          'บันทึกข้อมูล',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Column checkbox() {
    return Column(
      children: createLecturerCheckbox(),
    );
  }

  DropdownButton<Faculty> dropdownbtn() {
    return DropdownButton(
      value: _selectedFaculty,
      items: dropdownMenuItems,
      onChanged: (Faculty? value) {
        setState(() {
          _selectedFaculty = value as Faculty;
        });
      },
    );
  }

  Column majorradiobtn() {
    return Column(
      children: createMajorradio(),
    );
  }

  Column yearradiobtn() {
    return Column(
      children: createYearradio(),
    );
  }

  TextFormField studentID() {
    return TextFormField(
      controller: _usernamecontroller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'กรุณากรอกรหัสนิสิต';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'รหัสนิสิต',
        prefixIcon: Icon(Icons.account_box),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.deepPurple,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  TextFormField name() {
    return TextFormField(
      controller: _usernamecontroller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'กรุณากรอกชื่อ-นามสกุล';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'ชื่อ-นามสกุล',
        prefixIcon: Icon(Icons.account_box),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.deepPurple,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Text lecturertxt() {
    return const Text(
      'อาจารย์ที่ชอบ',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.deepPurple,
      ),
    );
  }

  Text facultytxt() {
    return const Text(
      'คณะที่กำลังศึกษา',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.deepPurple,
      ),
    );
  }

  Text majortxt() {
    return const Text(
      'หลักสูตรที่กำลังศึกษา',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.deepPurple,
      ),
    );
  }

  Text yearclasstxt() {
    return const Text(
      'ชั้นปีที่กำลังศึกษา',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.deepPurple,
      ),
    );
  }

  Text maintitle() {
    return const Text(
      'ข้อมูลส่วนตัวของนิสิต',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  List<Widget> createYearradio() {
    List<Widget> listRadioyear = [];

    for (var year in years) {
      listRadioyear.add(
        RadioListTile<dynamic>(
          title: Text('ชั้นปีที่ ' + year.number!),
          value: year.yearvalue,
          groupValue: yearValue,
          onChanged: (value) {
            setState(() {
              yearValue = value;
              // print(value);
            });
          },
        ),
      );
    }
    return listRadioyear;
  }

  List<Widget> createMajorradio() {
    List<Widget> listRadiomajor = [];

    for (var major in majors) {
      listRadiomajor.add(
        RadioListTile<dynamic>(
          title: Text(major.thName!),
          subtitle: Text(major.enName!),
          value: major.majorvalue,
          groupValue: majorValue,
          onChanged: (value) {
            setState(() {
              majorValue = value;
              // print(value);
            });
          },
        ),
      );
    }
    return listRadiomajor;
  }

  List<Widget> createLecturerCheckbox() {
    List<Widget> listCheckboxLecturer = [];

    for (var lecturer in lecturers) {
      listCheckboxLecturer.add(
        CheckboxListTile(
          title: Text(lecturer.thName!),
          subtitle: Text(lecturer.enName!),
          value: lecturer.checked,
          onChanged: (value) {
            setState(() {
              lecturer.checked = value!;
            });
            if (value!) {
              selectLecturer.add(lecturer.thName!);
            } else {
              selectLecturer.remove(lecturer.thName!);
            }
            // print(selectLecturer);
          },
        ),
      );
    }
    return listCheckboxLecturer;
  }
}

class Faculty {
  int? value;
  String? fname;

  Faculty(this.value, this.fname);
  static List<Faculty> getlistItem() {
    return [
      Faculty(1, 'วิทยาศาสตร์'),
      Faculty(2, 'วิทยาการสุขภาพและการกีฬา'),
      Faculty(3, 'เทคโนโลยีและการพัฒนาชุมชน'),
      Faculty(4, 'นิติศาสตร์'),
      Faculty(5, 'วิศวกรรมศาสตร์'),
      Faculty(6, 'อุตสาหกรรมเกษตรและชีวภาพ'),
      Faculty(7, 'พยาบาลศาสตร์'),
      Faculty(3, 'ศึกษาศาสตร์'),
    ];
  }
}
