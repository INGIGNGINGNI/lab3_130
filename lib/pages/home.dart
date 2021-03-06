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

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _studentIDcontroller = TextEditingController();

  String? yearValue;
  String? majorValue;

  late List<Year> years;
  late List<Major> majors;
  late List<Faculty> dropdownItems = Faculty.getfaculty();
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
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: const Text('???????????????????????????????????????????????????????????????'),
              content: const Text('???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('??????????????????'),
                ),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondPage(),
                    ),
                  ),
                  child: const Text('??????????????????'),
                ),
              ],
            ),
          );
          if (_formKey.currentState!.validate()) {
            print(_namecontroller.text);
            print(_studentIDcontroller.text);
          }
          return;
        },
        child: const Text(
          '????????????????????????????????????',
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
      controller: _studentIDcontroller,
      validator: (value) {
        if (value!.isEmpty) {
          return '??????????????????????????????????????????????????????';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      maxLength: 9,
      decoration: const InputDecoration(
        labelText: '???????????????????????????',
        prefixIcon: Icon(Icons.article),
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
      controller: _namecontroller,
      validator: (value) {
        if (value!.isEmpty) {
          return '???????????????????????????????????????-?????????????????????';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: '????????????-?????????????????????',
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
      '???????????????????????????????????????',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.deepPurple,
      ),
    );
  }

  Text facultytxt() {
    return const Text(
      '????????????????????????????????????????????????',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.deepPurple,
      ),
    );
  }

  Text majortxt() {
    return const Text(
      '???????????????????????????????????????????????????????????????',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.deepPurple,
      ),
    );
  }

  Text yearclasstxt() {
    return const Text(
      '?????????????????????????????????????????????????????????',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.deepPurple,
      ),
    );
  }

  Text maintitle() {
    return const Text(
      '???????????????????????????????????????????????????????????????',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.deepPurple,
      ),
    );
  }

  List<Widget> createYearradio() {
    List<Widget> listRadioyear = [];

    for (var year in years) {
      listRadioyear.add(
        RadioListTile<dynamic>(
          title: Text('??????????????????????????? ' + year.number!),
          value: year.yearvalue,
          groupValue: yearValue,
          onChanged: (value) {
            setState(() {
              yearValue = value;
              print(value);
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
              print(value);
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
            print(selectLecturer);
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
  static List<Faculty> getfaculty() {
    return [
      Faculty(1, '?????????????????????????????????'),
      Faculty(2, '????????????????????????????????????????????????????????????????????????'),
      Faculty(3, '???????????????????????????????????????????????????????????????????????????'),
      Faculty(4, '??????????????????????????????'),
      Faculty(5, '??????????????????????????????????????????'),
      Faculty(6, '????????????????????????????????????????????????????????????????????????'),
      Faculty(7, '????????????????????????????????????'),
      Faculty(3, '?????????????????????????????????'),
    ];
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY INFO'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    child: Card(
                      child: Text(
                        '?????????????????????????????????????????????????????????????????????????????????????????????',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      color: Colors.deepPurpleAccent,
                    ),
                    width: 350,
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: ElevatedButton(
              onPressed: () => Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              ),
              child: const Text('????????????????????????????????????????????????'),
            ),
          ),
        ],
      ),
    );
  }
}
