import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:his/common_function/binary_search.dart';
import 'package:http/http.dart';

import '../Api/test_api.dart';
import '../themes/colors.dart';
import 'cubit/list_cubit_cubit.dart';

class TakeRegister extends StatefulWidget {
  TakeRegister({Key? key}) : super(key: key) {}
  _TakeRegisterState d = _TakeRegisterState();
  @override
  State<TakeRegister> createState() {
    _TakeRegisterState f = d;
    print(f.customDropDownButtom1.state.value);
    d = _TakeRegisterState();
    d.customDropDownButtom1 = f.customDropDownButtom1;
    //print(d.customDropDownButtom1.state.value);
    d.customDropDownButtom2 = f.customDropDownButtom2;
    d.customDropDownButtom3 = f.customDropDownButtom3;
    return d;
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

class _TakeRegisterState extends State<TakeRegister> {
  _TakeRegisterState() {}
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
    //print('hell');
    return BlocProvider<ListCubitCubit>(
      create: (context) => ListCubitCubit(l1: '', l2: '', l3: ''),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back, color: Colors.black)),
          backgroundColor: CustomeColor.silver,
        ),
        body: Center(
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
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Text('Take Time', style: TextStyle(fontSize: 20)),
                    ),
                    Text('Specification', style: TextStyle(fontSize: 20)),
                    FutureBuilder(
                        future: fsm(),
                        builder: ((context, snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.data is Response) {
                            List list125 =
                                json.decode((snapshot.data as Response).body);
                            List<DropdownMenuItem<String>> list123 =
                                List<DropdownMenuItem<String>>.generate(
                                    list125.length, (index) {
                              return DropdownMenuItem(
                                value: list125[index]['id'].toString(),
                                child: Text(list125[0]['body'].toString()),
                              );
                            });
                            BlocProvider.of<ListCubitCubit>(context)
                                .update1(l: list123[0].value.toString());
                            return customDropDownButtom1 = CustomDropDownButtom(
                              f: (value) =>
                                  BlocProvider.of<ListCubitCubit>(context)
                                      .update1(l: value),
                              firstValue: list123[0].value.toString(),
                              l: list123,
                            );
                          } else {
                            return Container();
                          }
                        })),
                    Text('Doctor Name', style: TextStyle(fontSize: 20)),
                    FutureBuilder(
                        future: fsm2(),
                        builder: ((context, snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.data is Response) {
                            print(snapshot.error);
                            List list125 =
                                json.decode((snapshot.data as Response).body);
                            return BlocBuilder<ListCubitCubit, ListCubitState>(
                              buildWhen: (previous, current) {
                                return previous.dropdownChoice1 !=
                                    current.dropdownChoice1;
                              },
                              builder: (context, state) {
                                print(state.dropdownChoice1);
                                List<DropdownMenuItem<String>> list123 = [];
                                /*for (int i = 0; i < list125.length; i++) {
                                  if (list125[i]['postId'].toString() ==
                                      state.dropdownChoice1) {
                                        print(list125[i]['postId'].toString());
                                    list123.add(DropdownMenuItem(value: list125[i]['id'].toString(),
                                        child: Text(list125[i]['body'])));
                                  }
                                }*/
                                int rightPosition = binary_search(
                                    int.parse(state.dropdownChoice1),
                                    'postId',
                                    list125);
                                print(list125[rightPosition]);
                                if (list125[rightPosition]['postId']
                                        .toString() ==
                                    state.dropdownChoice1) {
                                  while (list125[rightPosition]['postId']
                                          .toString() ==
                                      state.dropdownChoice1) {
                                    list123.add(DropdownMenuItem(
                                        value: list125[rightPosition]['id']
                                            .toString(),
                                        child: Text(
                                            list125[rightPosition]['body'])));
                                    rightPosition++;
                                  }
                                }
                                return customDropDownButtom1 =
                                    CustomDropDownButtom(
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
                    Builder(
                      builder: (context) {
                        return BlocBuilder<ListCubitCubit, ListCubitState>(
                          buildWhen: (previous, current) =>
                              previous.dropdownChoice3 !=
                              current.dropdownChoice3,
                          builder: (context, state) {
                            print('rebuild');
                            switch (state.dropdownChoice3.length) {
                              case 0:
                                return Container();
                              default:
                                return Text('${state.dropdownChoice3}');
                            }
                          },
                        );
                      },
                    ),
                    Builder(builder: (context) {
                      return TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.blue),
                            overlayColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.blue)),
                        onPressed: () async {
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
                          BlocProvider.of<ListCubitCubit>(context)
                              .update3(l: date);
                        },
                        child: Text(
                            'Day you come ${customDropDownButtom2.state.value}',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      );
                    }),
                    Container(
                        decoration: BoxDecoration(shape: BoxShape.rectangle),
                        child: ElevatedButton(
                            onPressed: () => null, child: Text("Submit")))
                  ],
                ),
              )),
        ),
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
            isExpanded: true,
            focusColor: Color.fromARGB(255, 11, 144, 238),
            alignment: AlignmentDirectional.center,
            underline: Container(),
            dropdownColor: Color.fromARGB(255, 8, 141, 158),
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





/*
                  FutureBuilder(
                      future: fsm(),
                      builder: ((context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          List list125 =
                              json.decode((snapshot.data as Response).body);
                          List<DropdownMenuItem<String>> list123 =
                              List<DropdownMenuItem<String>>.generate(
                            list125.length,
                            (index) {
                              return DropdownMenuItem<String>(
                                  value: list125[index]['id'].toString(),
                                  child: Text(list125[index]['body']));
                            },
                          );
                          print(customDropDownButtom1.state.value);
                          try {
                            customDropDownButtom1 = CustomDropDownButtom(
                                f: (s) => setState(() {
                                      customDropDownButtom1.state.value = s;
                                    }),
                                firstValue: customDropDownButtom1.state.value,
                                l: list123);
                          } catch (e) {
                            print('error');
                            customDropDownButtom1 = CustomDropDownButtom(
                                f: (s) => setState(() {
                                      //print('kkkk');
                                    }),
                                firstValue: list123[0].value.toString(),
                                l: list123);
                          }

                          return customDropDownButtom1;
                        } else {
                          return Container();
                        }
                      })),*/
                      

/*
                  FutureBuilder(
                      future: fsm2(),
                      builder: ((context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          List list125 = snapshot.data is Response
                              ? json.decode((snapshot.data as Response).body)
                              : [];
                          //print(list125[0]['body']);
                          List<DropdownMenuItem<String>> list123 = [];
                          //print(customDropDownButtom1.state.value);
                          for (int i = 0; i < list125.length; i++) {
                            print(list125[i]['id'].toString());
                            //print(customDropDownButtom1.state.value == list125[i]['postId'].toString() ? list125[i]['postId'] : null);
                            customDropDownButtom1.state.value ==
                                    list125[i]['postId'].toString()
                                ? list123.add(DropdownMenuItem<String>(
                                    value: list125[i]['id'].toString(),
                                    child: Text(list125[i]['body'])))
                                : null;
                          }
                          //print(list123);
                          return customDropDownButtom2 = CustomDropDownButtom(
                              f: (s) => setState(() {
                                    customDropDownButtom2.state.value = s;
                                  }),
                              firstValue: list123[0].value.toString(),
                              l: list123);
                        } else {
                          return Container();
                        }
                      })),*/