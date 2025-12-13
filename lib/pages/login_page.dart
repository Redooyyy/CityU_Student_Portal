import 'package:choice/choice.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //for choice box
  final List<String> _dayOrEve = ['Day', 'Evening'];
  String? _dOrE;
  final List<Icon> _deIcon = [Icon(Icons.brightness_2), Icon(Icons.sunny)];

  void setSelectedVal(String? value) {
    setState(() {
      _dOrE = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          width: 348,
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
            padding: const EdgeInsets.fromLTRB(25, 35, 8, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Student ID",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle_sharp),
                      //TODO:focus color change
                      focusColor: Colors.red,
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

                //TODO:fixing the choice boxes must
                //NOTE:choice box just initialized didn't fetched the selected value
                InlineChoice<String>.single(
                  onChanged: setSelectedVal,
                  clearable: true,
                  itemCount: _dayOrEve.length,
                  itemBuilder: (state, index) {
                    return ChoiceChip(
                      label: Text(_dayOrEve[index]),
                      selected: _dayOrEve[index] == _dOrE,
                      onSelected: state.onSelected(_dayOrEve[index]),
                    );
                  },
                  listBuilder: ChoiceList.createScrollable(
                    runSpacing: 0.0,
                    spacing: 8.0,
                  ),
                ),

                //PERF:value is updating without any error
                Text(_dOrE.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
