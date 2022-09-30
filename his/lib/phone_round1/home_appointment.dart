import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeVisit extends StatelessWidget {
  HomeVisit({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              title: Text("اححز زيارة منزلية"),
              leading: Icon(Icons.arrow_back),
              backgroundColor:
                  Color.fromARGB(255, 34, 107, 235).withOpacity(0.9)),
          body: ListView(children: [
            Container(width: double.infinity,height:300,color:Colors.white,
              child: Center(
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(50)),
                      color: Color.fromARGB(255, 18, 87, 206).withOpacity(0.9)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Image(
                          height: 100,
                          width: 100,
                          image: AssetImage(
                              'assets/assets_phone_round2/icons/pic2.png')),
                      Text(
                        "احجز زيارة منزلية",
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "الان من خلال فيزتا يمكنك ححز زيارة منزلية   . ",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "مع دكتور متخصيص",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_circle_down_rounded, color: Colors.white)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
              child: Form(
                key: _formKey,
                child: Container(
                    margin: EdgeInsets.only(
                        bottom: 20, top: 30, left: 20, right: 20),
                    child: Column(
                      children: [
                        CustomeInput(hold: "ادخل الاسم",
                          validator: (input) {
                            return "hhhh";
                          },
                          title: "الاسم",
                        ),
                        CustomeInput(hold: "ادخل الاسم",
                          validator: (input) {},
                          title: "رقم التلفيون",
                        ),
                        CustomeDropDown(
                          value: "kkk",
                          title: "التخصص",
                          list: ["kkk", "mmm", "llll", "iuuuuu", "edscvgt"],
                        ),
                        CustomeDropDown(
                          value: "kkk",
                          title: " المنطقة ",
                          list: ["kkk", "mmm", "llll", "iuuuuu", "edscvgt"],
                        ),
                        GestureDetector(
                          onTap: () {
                            print('object');
                            _formKey.currentState!.validate();
                          },
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(color: Colors.red),
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Text("تاكيد",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ),
            RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.grey),
                    text: "برجاء العلم:",
                    children: [
                  TextSpan(
                    style: TextStyle(fontSize: 50, color: Colors.black),
                    text: "\n.",
                  ),
                  TextSpan(style: TextStyle(color: Colors.grey), text: """
فيزيتا ليست منشأة طبية و أنما هي وسيط بين مقدمي الخدمة الصحية المرخصين و المرضي عن طريق موقعها الإلكتروني / تطبيقات الهاتف.
لا تحل فيزيتا محل علاقة طبيب الرعاية الأولية الموجودة.
تخضع الخدمات الطبية التي يقدمها مقدمي الخدمات الصحية لحكمهم المهني.
"""),
                  TextSpan(
                    style: TextStyle(fontSize: 50, color: Colors.black),
                    text: "\n.",
                  ),
                  TextSpan(style: TextStyle(color: Colors.grey), text: """
   لا يصف الأطباء و مقدمي الخدمات المواد الخاضعة للتحكم و الأدوية المدرجة علي الجداول المخدرة والأدوية غير العلاجية وبعض الأدوية الأخرى التي قد تكون ضارة بسبب احتمال إساءة استخدامها.
جميع البيانات التي يتم جمعها من المرضي يتم إستخدامها وفقاً لقوانين و اللوائح بجمهرية مصر العربية. 

"""),
                  TextSpan(
                    style: TextStyle(fontSize: 50, color: Colors.black),
                    text: "\n.",
                  ),
                  TextSpan(style: TextStyle(color: Colors.grey), text: """
  لا تضمن فيزيتا كتابة وصفة طبية.

""")
                ])),
            Container(
              child: Center(
                  child: Text(
                "2020جميع الحقوق محفوظة ",
                style: TextStyle(color: Colors.white),
              )),
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 50,
              width: double.infinity,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 19, 63, 183)),
            )
          ])),
    );
  }
}

class CustomeInput extends StatelessWidget {
  CustomeInput({required this.hold,required this.validator, required this.title, Key? key})
      : super(key: key);
  String title;
  String hold ;
  String? Function(String? input) validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          TextFormField(
              validator: validator,
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.justify,
              decoration:
                  InputDecoration(hintText: hold,border: OutlineInputBorder(gapPadding: 1))),
        ],
      ),
    );
  }
}

class CustomeDropDown extends StatefulWidget {
  CustomeDropDown(
      {required this.title, required this.list, required this.value, Key? key})
      : super(key: key);
  String value;
  String title;
  List<String> list;
  @override
  State<CustomeDropDown> createState() => _CustomeDropDownState();
}

class _CustomeDropDownState extends State<CustomeDropDown> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isClicked = !isClicked;
              });
            },
            child: Container(
              height: 40,
              padding: EdgeInsets.only(bottom: 10),
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Row(children: [
                Expanded(child: Text("${widget.value}")),
                Icon(
                  isClicked ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                )
              ]),
            ),
          ),
          isClicked
              ? Container(
                  width: double.infinity,
                  height: 60,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.list.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.value = widget.list[index];
                            isClicked = false;
                          });
                        },
                        child: Container(
                            height: 60,
                            width: double.infinity,
                            child: Text(widget.list[index])),
                      );
                    },
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
