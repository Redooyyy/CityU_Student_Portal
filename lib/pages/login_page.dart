import 'package:choice/choice.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //for choice box
  final List<String> _dayOrEve = ['Day', 'Evening'];
  final departmentDropdownController = DropdownController<String>();
  late List<CoolDropdownItem<String>> departmentItems;
  final Color active = Color.fromRGBO(170, 129, 217, 0.4);
  final Color defaultColor = Color.fromRGBO(255, 255, 255, 0.9);
  final String pleaseSelect = 'Select department';

  final List<String> _department = [
    'CSE',
    'BSTE',
    'Pharmacy',
    'English',
    'EEE',
    'BBA',
    'Agriculture',
  ];
  @override
  void initState() {
    super.initState();
    // TODO: implement initState

    departmentItems = _department.map((dept) {
      return CoolDropdownItem<String>(
        label: dept, // text shown
        value: dept, // actual value
      );
    }).toList();
  }

  String? _dOrE;
  bool _daySelect = false;
  bool _obsecureText = true;
  String? _userDepartment;
  final List<Icon> _deIcon = [Icon(Icons.brightness_2), Icon(Icons.sunny)];
  void _selectedDepartment(String? department) {
    if (department is String) {
      setState(() {
        _userDepartment = department;
      });
    }
  }

  void setSelectedVal(String? value) {
    setState(() {
      _dOrE = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //NOTE:Login card
        child: Container(
          margin: .all(25),
          height: 500,
          width: MediaQuery.widthOf(context),
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.9),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 35, 25, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                feildHint("Sudent ID"),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle_sharp),
                      //TODO:focus color change
                      focusColor: Colors.blue,
                      border: OutlineInputBorder(
                        //TODO:have to change border side
                        borderSide: BorderSide(width: 0.2, color: Colors.blue),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      hintText: "Enter your student ID",
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                feildHint("Password"),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TextField(
                    obscureText: _obsecureText,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() => _obsecureText = !_obsecureText);
                        },
                        icon: Icon(
                          _obsecureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      prefixIcon: Icon(Icons.key),
                      //TODO:focus color change
                      focusColor: Colors.blue,
                      border: OutlineInputBorder(
                        //TODO:have to change border side
                        borderSide: BorderSide(width: 0.2, color: Colors.blue),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      hintText: "Password",
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                feildHint("Department"),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    width: MediaQuery.widthOf(context),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      borderRadius: .circular(18),
                    ),
                    child: CoolDropdown<String>(
                      resultOptions: ResultOptions(
                        placeholder: 'Select Department',
                      ),
                      dropdownList: departmentItems,
                      controller: departmentDropdownController,
                      onChange: (a) {
                        departmentDropdownController.close();
                        print("selected");
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                //BUG:Color not swithing while selecting chips
                //TODO:fixing the choice boxes must
                //NOTE:choice box just initialized didn't fetched the selected value
                //PERF:value is updating without any error
                Row(
                  children: [
                    ChoiceChip(
                      backgroundColor: _daySelect ? active : defaultColor,
                      showCheckmark: false,
                      label: Text("Day"),
                      selected: _daySelect,
                      onSelected: (newVal) {
                        setState(() {
                          _daySelect = !_daySelect;
                          _dOrE = "Day";
                        });
                      },
                    ),

                    SizedBox(width: 10),

                    ChoiceChip(
                      backgroundColor: _daySelect ? defaultColor : active,
                      showCheckmark: false,
                      label: Text("Evening"),
                      selected: _daySelect,
                      onSelected: (newVal) {
                        setState(() {
                          _daySelect = !_daySelect;
                          _dOrE = "Evening";
                        });
                      },
                    ),
                  ],
                ),
                Text(_dOrE.toString()),
                Text(_userDepartment.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text feildHint(String s) {
    return Text(s, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600));
  }
}
