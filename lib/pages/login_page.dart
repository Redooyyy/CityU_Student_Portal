import 'package:chip_list/chip_list.dart';
import 'package:cityu_student_protal/custom_widget/glassy_button.dart';
import 'package:cityu_student_protal/custom_widget/glassy_container.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';

//TODO:Have to clean and split in files

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //NOTE:User inputs
  String _usrDepartment = "";
  String _usrBatch = "";
  //for choice box
  final departmentDropdownController = DropdownController<String>();
  final batchController = DropdownController<String>();
  final TextEditingController _shiftController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late List<CoolDropdownItem<String>> departmentItems;
  late List<CoolDropdownItem<String>> batchList;

  final List<String> _dayEveningList = ["Day", "Evening"];
  final List<String> _department = [
    'CSE',
    'BSTE',
    'Pharmacy',
    'English',
    'EEE',
    'BBA',
    'Agriculture',
  ];

  //TODO:generate batch according to department
  final List<String> _batch = [
    '59',
    '60',
    '61',
    '62',
    '63',
    '64',
    '65',
    '66',
    '67',
    '68',
  ];
  @override
  void initState() {
    super.initState();
    // _shiftController.text = _dayEveningList[0];
    loadDept();
    loadBatch();
  }

  int _dayEveIndx = -1;
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
      // _dOrE = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                // image: NetworkImage(
                //   'https://media.licdn.com/dms/image/v2/C511BAQHE9ado2KPp6A/company-background_10000/company-background_10000/0/1584245134523/city_university_bd_cover?e=2147483647&v=beta&t=aXKXdFMzpOQuYWb-t1YzBNWcQkl-saKLh64B_ZLfyOU',
                // ),
                image: AssetImage("assets/images/backgroundTest.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 8.0, 25.0, 8.0),
                    child: GlassContainer(
                      height: 450,
                      width: MediaQuery.widthOf(context),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0.0, 25, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: Image(
                                    image: AssetImage(
                                      "assets/images/university.png",
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                            // const SizedBox(height: 15),

                            //NOTE:Student_ID feild
                            SizedBox(
                              height: 55,
                              child: TextField(
                                controller: _studentIdController,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                                cursorColor: Colors.white,
                                cursorOpacityAnimates: true,
                                decoration: InputDecoration(
                                  floatingLabelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  labelText: "Student ID",
                                  labelStyle: TextStyle(color: Colors.white38),
                                  prefixIcon: Icon(
                                    Icons.account_circle_sharp,
                                    color: Colors.white,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1.5,
                                      color: Colors.black54,
                                    ),
                                    borderRadius: .circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1.5,
                                      color: Colors.white,
                                    ),
                                    borderRadius: .circular(15),
                                  ),
                                  // hintText: "Enter your student ID",
                                ),
                              ),
                            ),

                            const SizedBox(height: 12),

                            //NOTE:Department Dropdown
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: SizedBox(
                                width: MediaQuery.widthOf(context),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: CoolDropdown<String>(
                                        onOpen: (isOpen) {
                                          FocusScope.of(context).unfocus();
                                        },
                                        dropdownOptions: DropdownOptions(
                                          color: Colors.white70.withValues(
                                            alpha: 0.9,
                                          ),
                                        ),
                                        resultOptions: ResultOptions(
                                          height: 55,
                                          placeholder: 'Department',
                                          placeholderTextStyle: TextStyle(
                                            color: Colors.white38,
                                          ),
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                          ),
                                          boxDecoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: .circular(18),
                                            border: BoxBorder.all(
                                              width: 1.5,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          openBoxDecoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: .circular(18),
                                            border: .all(
                                              width: 1.5,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        dropdownList: departmentItems,
                                        controller:
                                            departmentDropdownController,
                                        onChange: (a) {
                                          departmentDropdownController.close();
                                          print("selected");
                                          _usrDepartment = a;
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 10),

                                    //NOTE:Btach Dropdown
                                    Expanded(
                                      flex: 1,
                                      child: CoolDropdown<String>(
                                        onOpen: (isOpen) {
                                          FocusScope.of(context).unfocus();
                                        },
                                        dropdownOptions: DropdownOptions(
                                          color: Colors.white70.withValues(
                                            alpha: 0.9,
                                          ),
                                        ),
                                        resultOptions: ResultOptions(
                                          height: 55,
                                          placeholder: 'Batch',
                                          placeholderTextStyle: TextStyle(
                                            color: Colors.white38,
                                          ),
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                          ),
                                          boxDecoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: .circular(18),
                                            border: BoxBorder.all(
                                              width: 1.5,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          openBoxDecoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: .circular(18),
                                            border: .all(
                                              width: 1.5,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        dropdownList: batchList,
                                        controller: batchController,
                                        onChange: (a) {
                                          batchController.close();
                                          print("selected");
                                          _usrBatch = a;
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 12),

                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: SizedBox(
                                    height: 48,
                                    child: TextField(
                                      readOnly: true,
                                      controller: _shiftController,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                      cursorColor: Colors.white,
                                      cursorOpacityAnimates: true,
                                      decoration: InputDecoration(
                                        floatingLabelStyle: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        hintText: "Shift",
                                        hintStyle: TextStyle(
                                          color: Colors.white38,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1.5,
                                            color: Colors.black54,
                                          ),
                                          borderRadius: .circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1.5,
                                            color: Colors.white,
                                          ),
                                          borderRadius: .circular(15),
                                        ),
                                        // hintText: "Enter your student ID",
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),

                                //BUG:Color not swithing while selecting chips
                                //TODO:fixing the choice boxes must
                                //NOTE:Day/Evening Choicebox
                                Expanded(
                                  flex: 3,
                                  child: ChipList(
                                    extraOnToggle: (val) => setState(() {
                                      _dayEveIndx = val;
                                      _shiftController.text =
                                          _dayEveningList[val];
                                    }),
                                    listOfChipIndicesCurrentlySelected:
                                        _dayEveIndx != -1 ? [_dayEveIndx] : [],

                                    showCheckmark: false,
                                    listOfChipNames: _dayEveningList,
                                    inactiveTextColorList: [Colors.black],
                                    inactiveBgColorList: [Colors.transparent],
                                    activeBgColorList: [Colors.blue.shade300],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            //NOTE:Password Feild
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: SizedBox(
                                height: 55,
                                child: TextField(
                                  controller: _passwordController,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                  cursorColor: Colors.white,
                                  cursorOpacityAnimates: true,
                                  obscureText: _obsecureText,
                                  decoration: InputDecoration(
                                    floatingLabelStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(
                                          () => _obsecureText = !_obsecureText,
                                        );
                                      },

                                      //TODO:Icon visibility off if Password feild is empty
                                      icon: Icon(
                                        _obsecureText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.white,
                                      ),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.key,
                                      color: Colors.white,
                                    ),
                                    //TODO:focus color change
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1.5,
                                        color: Colors.black54,
                                      ),
                                      borderRadius: .circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1.5,
                                        color: Colors.white,
                                      ),
                                      borderRadius: .circular(15),
                                    ),
                                    labelText: "Password",
                                    labelStyle: TextStyle(
                                      color: Colors.white38,
                                    ),
                                    // hintText: "Enter your student ID",
                                  ),
                                ),
                              ),
                            ),

                            //NOTE:For Debuging
                            // Text(_dayEveningList[_dayEveIndx]),
                            // Text(_usrDepartment + " " + _usrBatch),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Center(
                    child: GlassButton(
                      isBorderButton: true,

                      width: 150,
                      height: 50,
                      onTab: () async {
                        await Future.delayed(Duration(milliseconds: 2500));
                      },
                      title: "LOGIN",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void loadDept() {
    departmentItems = _department.map((dept) {
      return CoolDropdownItem<String>(
        label: dept, // text shown
        value: dept, // actual value
      );
    }).toList();
  }

  void loadBatch() {
    batchList = _batch.map((allBatch) {
      return CoolDropdownItem<String>(label: allBatch, value: allBatch);
    }).toList();
  }
}
