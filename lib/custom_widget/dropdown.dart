import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';

class MyDropdown {
  final String placeholder;
  final Function onTab;
  final Function(String) onChnage;
  final DropdownController<String> controller;
  final List<String> items;
  late List<CoolDropdownItem<String>> dropDownItem;

  MyDropdown({
    required this.onTab,
    required this.controller,
    required this.items,
    required this.onChnage,
    required this.placeholder,
  }) {
    loadItems();
  }

  Widget myDropdown(BuildContext context) {
    return CoolDropdown<String>(
      onOpen: (isOpen) {
        FocusScope.of(context).unfocus();
      },
      dropdownOptions: DropdownOptions(
        color: Colors.white70.withValues(alpha: 0.8),
      ),
      resultOptions: ResultOptions(
        height: 55,
        placeholder: placeholder,
        placeholderTextStyle: TextStyle(color: Colors.white38),
        textStyle: TextStyle(color: Colors.white, fontSize: 15),
        boxDecoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: .circular(18),
          border: BoxBorder.all(width: 1.5, color: Colors.black54),
        ),
        openBoxDecoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: .circular(18),
          border: .all(width: 1.5, color: Colors.white),
        ),
      ),
      dropdownList: dropDownItem,
      controller: controller,
      onChange: onChnage,
    );
  }

  void loadItems() {
    dropDownItem = items.map((dept) {
      return CoolDropdownItem<String>(
        label: dept, // text shown
        value: dept, // actual value
      );
    }).toList();
  }
}
