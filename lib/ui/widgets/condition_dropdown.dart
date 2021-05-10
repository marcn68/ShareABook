import 'package:flutter/material.dart';
import 'package:share_a_book/business_logic/models/book.dart';
import 'package:share_a_book/shared/constants.dart';

class ConditionDropDown extends StatefulWidget {
  const ConditionDropDown({
    this.updateCondition,
  });

  final void Function(Condition) updateCondition;

  @override
  _ConditionDropDownState createState() => _ConditionDropDownState();
}

class _ConditionDropDownState extends State<ConditionDropDown> {
  Condition _condition;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Constants.PRIMARY_ORANGE, width: 3),
      ),
      child: DropdownButton<Condition>(
          isExpanded: true,
          hint: Text("Select an option"),
          value: _condition,
          items: [
            DropdownMenuItem(
              child: Text("As New"),
              value: Condition.AsNew,
            ),
            DropdownMenuItem(
              child: Text("Fine"),
              value: Condition.Fine,
            ),
            DropdownMenuItem(
              child: Text("Very Good"),
              value: Condition.VeryGood,
            ),
            DropdownMenuItem(
              child: Text("Good"),
              value: Condition.Good,
            ),
            DropdownMenuItem(
              child: Text("Poor"),
              value: Condition.Poor,
            ),
          ],
          onChanged: (Condition value) {
            setState(() {
              _condition = value;
            });
            print(_condition);
            widget.updateCondition(value);
          }),
    );
  }
}
