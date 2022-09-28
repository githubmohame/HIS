import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:his/Api/test_api.dart';
import 'package:his/common_function/binary_search.dart';
import 'package:http/http.dart';

import '../themes/colors.dart';
import 'cubit/list_cubit_cubit.dart';

class AppointmentScreen extends StatefulWidget {
  AppointmentScreen({Key? key}) : super(key: key) {}
  @override
  State<AppointmentScreen> createState() {
    return _AppointmentScreenState();
  }
}

Future<DateTime?> _selecttime(BuildContext context, List<int> list) async {
  DateTime rightDate = DateTime.now();
  while ([rightDate.weekday].toSet().intersection(list.toSet()).length == 0) {
    rightDate = rightDate.add(Duration(days: 1));
    print('jjkkkkkkk');
  }
  return showDatePicker(
      selectableDayPredicate: (day) {
        return [day.weekday].toSet().intersection(list.toSet()).length >= 1;
      },
      context: context,
      firstDate: DateTime.now(),
      initialDate: rightDate,
      lastDate: DateTime(2090));
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  _AppointmentScreenState() {}

  @override
  Widget build(BuildContext context) {
    //print('hell');
    return BlocProvider<ListCubitCubit>(
      create: (context) => ListCubitCubit(l1: '', l2: '', l3: ''),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    colors: [
                  Color.fromARGB(255, 128, 187, 236),
                  Color.fromARGB(255, 249, 246, 246)
                ])),
            child: AppBar(
              shadowColor: Colors.transparent,
              bottomOpacity: 0,
              foregroundColor: Colors.white,
              surfaceTintColor: Colors.transparent,
              title: Center(
                child: Text('Take Time', style: TextStyle(fontSize: 30)),
              ),
              leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back, color: Colors.black)),
              backgroundColor: Colors.transparent,
            ),
          ),
        ), 
        body:  AppointmentPhone(),
      ),
    );
  }
}

class CustomDropDownButtom extends StatefulWidget {
  CustomDropDownButtom(
      {required Function f,
      required String firstValue,
      required List<DropdownMenuItem<String>> l,
      Key? key})
      : state = _CustomDropDownButtomState(f: f, value: firstValue, items: l),
        super(key: key);
  _CustomDropDownButtomState state;
  @override
  State<CustomDropDownButtom> createState() {
    print(state.value);
    return state = _CustomDropDownButtomState(
        f: state.f, value: state.value, items: state.items);
  }
}

class _CustomDropDownButtomState extends State<CustomDropDownButtom> {
  List<DropdownMenuItem<String>> items;
  String value;
  Function f;
  _CustomDropDownButtomState(
      {required this.f, required this.value, required this.items});
  @override
  Widget build(BuildContext context) {
    this.value.isEmpty && items.isNotEmpty
        ? value = items[0].value.toString()
        : value;
    return items.isEmpty
        ? Container()
        : DropdownButton<String>(
            itemHeight: 50,
            borderRadius: BorderRadius.circular(20), menuMaxHeight: 100,
            isExpanded: true,
            //focusColor: Color.fromARGB(255, 11, 144, 238),
            alignment: AlignmentDirectional.center,
            underline: Container(),
            // dropdownColor: Color.fromARGB(255, 8, 141, 158),
            value: this.value,
            items: items,
            onChanged: (value) {
              value is String ? this.value = value : null;
              setState(() {
                //print(value);
              });
              //print(this.value);
              f(value);
            },
          );
  }
}

class AppointmentPhone extends StatefulWidget {
    AppointmentPhone({Key? key}) : super(key: key);
  _AppointmentPhoneState d = _AppointmentPhoneState();

  @override
  State<AppointmentPhone> createState() {
    _AppointmentPhoneState f = d;
    print(f.customDropDownButtom1.state.value);
    d = _AppointmentPhoneState();
    d.customDropDownButtom1 = f.customDropDownButtom1;
    //print(d.customDropDownButtom1.state.value);
    d.customDropDownButtom2 = f.customDropDownButtom2;
    d.customDropDownButtom3 = f.customDropDownButtom3;
    return d;
  }
}

class _AppointmentPhoneState extends State<AppointmentPhone> {
   CustomDropDownButtom customDropDownButtom1 = CustomDropDownButtom(
    f: () => null,
    firstValue: '',
    l: [],
  );

  CustomDropDownButtom customDropDownButtom2 = CustomDropDownButtom(
    f: () => null,
    firstValue: '',
    l: [],
  );
  late CustomDropDownButtom customDropDownButtom3 = CustomDropDownButtom(
    f: () => null,
    firstValue: '',
    l: [],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey,
            gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [Color.fromARGB(255, 128, 187, 236), Colors.white])),
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Take Time",
                    style: TextStyle(color: Colors.black, fontSize: 20))
              ]),
              Container(margin:EdgeInsets.only(left:10),
                child: Text('Specification',
                    style: TextStyle(color: Colors.black, fontSize: 20)),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 2),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: FutureBuilder(
                    future: fsm(),
                    builder: ((context, snapshot) {
                      print(snapshot.data);
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.data is Response) {
                        List list125 =
                            json.decode((snapshot.data as Response).body);
                        List<DropdownMenuItem<String>> list123 =
                            List<DropdownMenuItem<String>>.generate(
                                list125.length, (index) {
                          return DropdownMenuItem<String>(
                            value: list125[index]['id'].toString(),
                            child: Text(list125[0]['body'].toString(),
                                style: TextStyle(fontSize: 15)),
                          );
                        });
                        BlocProvider.of<ListCubitCubit>(context)
                            .update1(l: list123[0].value.toString());
                        return customDropDownButtom1 = CustomDropDownButtom(
                          f: (value) => BlocProvider.of<ListCubitCubit>(context)
                              .update1(l: value),
                          firstValue: list123[0].value.toString(),
                          l: list123,
                        );
                      } else {
                        return Container();
                      }
                    })),
              ),
              Container(margin:EdgeInsets.only(left:10),
                child: Text('Doctor Name',
                    style: TextStyle(color: Colors.black, fontSize: 20)),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 2),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: FutureBuilder(
                    future: fsm2(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.data is Response) {
                        print(snapshot.data);
                        List list125 =
                            json.decode((snapshot.data as Response).body);
                        return BlocBuilder<ListCubitCubit, ListCubitState>(
                          buildWhen: (previous, current) {
                            return previous.dropdownChoice1 !=
                                current.dropdownChoice1;
                          },
                          builder: (context, state) {
                            List<DropdownMenuItem<String>> list123 = [];
                            int rightPosition = binary_search(
                                int.parse(state.dropdownChoice1),
                                'postId',
                                list125);
                            if (list125[rightPosition]['postId'].toString() ==
                                state.dropdownChoice1) {
                              while (
                                  list125[rightPosition]['postId'].toString() ==
                                      state.dropdownChoice1) {
                                list123.add(DropdownMenuItem<String>(
                                  value:
                                      list125[rightPosition]['id'].toString(),
                                  child: Container(
                                    height: 500,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                        list125[rightPosition]['body']  ,
                                        style: TextStyle(fontSize: 15)),
                                  ),
                                ));
                                rightPosition++;
                              }
                            }
                            return customDropDownButtom1 = CustomDropDownButtom(
                              f: (value) =>
                                  BlocProvider.of<ListCubitCubit>(context)
                                      .update2(l: value),
                              firstValue: list123[0].value.toString(),
                              l: list123,
                            );
                          },
                        );
                      } else {
                        return Container();
                      }
                    })),
              ),
              Builder(
                builder: (context) {
                  return BlocBuilder<ListCubitCubit, ListCubitState>(
                    buildWhen: (previous, current) =>
                        previous.dropdownChoice3 != current.dropdownChoice3,
                    builder: (context, state) {
                      switch (state.dropdownChoice3.length) {
                        case 0:
                          return Container();
                        default:
                          return Text(
                            'Date:${state.dropdownChoice3}',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          );
                      }
                    },
                  );
                },
              ),
              Builder(builder: (context) {
                return GestureDetector(
                  onTap: () async {
                    DateTime? day = await _selecttime(context, [1, 2, 3]);
                    print('kkiiooo6789000000776\n');
                    if (day.runtimeType == Null) {
                      print('kkkii8888996666\n');
                    }
                    print(day.runtimeType);
                    String date;
                    date = day!.day.toString() +
                        '/' +
                        day.month.toString() +
                        "/" +
                        day.year.toString();
                    BlocProvider.of<ListCubitCubit>(context).update3(l: date);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(120),
                        color: Colors.blue),
                    margin: EdgeInsets.only(left: 50, right: 10),
                    width: 50,
                    height: 50,
                    child: Center(
                      child: Text(
                          'Day you come ${customDropDownButtom2.state.value}',
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                    ),
                  ),
                );
              }),
              GestureDetector(
                onTap: () => print('object'),
                child: Container(
                  margin: EdgeInsets.only(left: 50, right: 10),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      border: Border.all(width: 2, color: Colors.grey),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(800)),
                  child: Center(
                      child: Text('Submit',
                          style: TextStyle(color: Colors.white))),
                ),
              )
            ],
          ),
        ));
  }
}
