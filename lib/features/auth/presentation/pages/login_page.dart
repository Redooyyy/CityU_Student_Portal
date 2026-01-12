//TODO:Have to clean and split in files

import 'package:chip_list/chip_list.dart';
import 'package:cityu_student_protal/core/custom_widget/glassy_button_loading.dart';
import 'package:cityu_student_protal/core/custom_widget/glassy_container.dart';
import 'package:cityu_student_protal/features/auth/presentation/widget/dropdown.dart';
import 'package:cityu_student_protal/pages/home_page.dart';
import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //NOTE:User inputs
  String _usrDepartment = "";
  String _usrBatch = "";

  //Dropdown controllers
  final departmentDropdownController = DropdownController<String>();
  final batchController = DropdownController<String>();

  //Textfield controllers
  final TextEditingController _shiftController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //texting values
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
  }

  int _dayEveIndx = -1;
  bool _obsecureText = true;

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
                image: AssetImage("assets/images/background.gif"),
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
                                      child: MyDropdown(
                                        items: _department,
                                        placeholder: "Department",
                                        onTab: () {},
                                        onChnage: (a) {
                                          print(a);
                                          departmentDropdownController.close();
                                        },
                                        controller:
                                            departmentDropdownController,
                                      ).myDropdown(context),
                                    ),

                                    const SizedBox(width: 10),

                                    //NOTE:Btach Dropdown
                                    Expanded(
                                      flex: 1,
                                      child: MyDropdown(
                                        controller: batchController,
                                        placeholder: "Batch",
                                        onChnage: (a) {
                                          batchController.close();
                                          print(a);
                                        },
                                        onTab: () {},
                                        items: _batch,
                                      ).myDropdown(context),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 12),

                            //TODO:Must create my own choice chip for better UI
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
                      buttonColor: Colors.white.withValues(alpha: 0.3),
                      width: 150,
                      height: 50,
                      onTab: () async {
                        await Future.delayed(Duration(milliseconds: 2500));
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      TextWidget: Text(
                        "LOGIN",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
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
}
