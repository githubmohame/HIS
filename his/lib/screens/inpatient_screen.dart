import 'package:flutter/material.dart';

import '../themes/colors.dart';

class Inpatient extends StatefulWidget {
  const Inpatient({Key? key}) : super(key: key);

  @override
  State<Inpatient> createState() => _InpatientState();
}

class _InpatientState extends State<Inpatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back, color: Colors.black)),
        backgroundColor: CustomeColor.silver,
      ),
      body: Container(
          child: Center(
            child: Container(
              padding: EdgeInsets.only(top: 50, bottom: 50),
              width: 700,
              height: 700,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      30,
                    ),
                  ),
                  border: Border.all(width: 5, color: Colors.black)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Text('Registeration InPatient',
                        style: TextStyle(fontSize: 30)),
                  ),
                   CustomDropDownButtom(firstValue: 'tell me1',l: List.generate(100, (index) => DropdownMenuItem<String>(value: 'tell me${index}',child: Text('tell me$index'),)),),
                   CustomDropDownButtom(firstValue: 'tell me1',l: List.generate(100, (index) => DropdownMenuItem<String>(value: 'tell me${index}',child: Text('tell me$index'),)),),

                   CustomDropDownButtom(firstValue: 'tell me',l: [DropdownMenuItem<String>(value: 'tell me',child: Text('tell me'),)
                   ,DropdownMenuItem<String>(value: 'tell me2',child: Text('tell me'),)
                   ,DropdownMenuItem<String>(value: 'tell me3',child: Text('tell me'),)
                   ,DropdownMenuItem<String>(value: 'tell me4',child: Text('tell me'),)
                   ],),
                  Container(decoration: BoxDecoration( shape: BoxShape.rectangle),child: ElevatedButton(onPressed: () => null, child: Text("Submit")))
                ],
              ),
            ),
          ),
          decoration: BoxDecoration(
              color: CustomeColor.MainScreenButtomColorFirst,
              shape: BoxShape.rectangle)),
    );
  }
}

class CustomDropDownButtom extends StatefulWidget {
  CustomDropDownButtom({required String firstValue,required List<DropdownMenuItem<String>> l, Key? key})
      : state = _CustomDropDownButtomState(value: firstValue,items: l),
        super(key: key);
  _CustomDropDownButtomState state;
  @override
  State<CustomDropDownButtom> createState() =>
      state = _CustomDropDownButtomState(value: state.value,items: state.items);
}

class _CustomDropDownButtomState extends State<CustomDropDownButtom> {
  List<DropdownMenuItem<String>> items;
  String value;
  _CustomDropDownButtomState({required this.value, required this.items});
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(isExpanded: true, focusColor: Colors.grey,alignment: AlignmentDirectional.center,underline: Container() ,dropdownColor: Colors.grey,
      value: this.value,
      items: items,
      onChanged: (value) {
        setState(() {
          value is String?this.value = value:null;
        });
      },
    );
  }
}
