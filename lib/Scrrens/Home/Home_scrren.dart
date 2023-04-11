import 'package:final_exam_flutter/Scrrens/Model_class/TableModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home_scrren extends StatefulWidget {
  const Home_scrren({Key? key}) : super(key: key);

  @override
  State<Home_scrren> createState() => _Home_scrrenState();
}

class _Home_scrrenState extends State<Home_scrren> {
  TextEditingController txtno = TextEditingController(text: ("1"));
  int i=1;
  int d=1;
  List<table_model> ans = [
    table_model(a: 1, b: 1, c: 1),
    table_model(a: 1, b: 2, c: 2),
    table_model(a: 1, b: 3, c: 3),
    table_model(a: 1, b: 4, c: 4),
    table_model(a: 1, b: 5, c: 5),
    table_model(a: 1, b: 6, c: 6),
    table_model(a: 1, b: 7, c: 7),
    table_model(a: 1, b: 8, c: 8),
    table_model(a: 1, b: 9, c: 9),
    table_model(a: 1, b: 10, c: 10),
  ];

  var txtkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: txtkey,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text("Multiplication Table",
                style: GoogleFonts.anton(fontSize: 20, color: Colors.orange)),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                //text
                Text(
                  "Input The Number",
                  style: GoogleFonts.anton(fontSize: 18, color: Colors.orange),
                ),
                //input
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if(value!.isEmpty)
                      {
                        return "Plies Enter The No";
                      }
                  },
                  controller: txtno,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red)),
                      label: Text(
                        "Enter Number",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      prefixIcon: Icon(
                        Icons.dialpad_sharp,
                        color: Colors.orange,
                        size: 30,
                      )),
                ),
                //button
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    if(txtkey.currentState!.validate())
                      {
                        d = int.parse(txtno.text);
                        setState(() {
                          ans.clear();
                          perform();
                        });
                      }
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 3)
                        ],
                        color: Colors.red),
                    alignment: Alignment.center,
                    child: Text(
                      "Show Table",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                //table
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return table(ans[index]);
                    },
                    itemCount: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget table(table_model t1) {
    return Container(
      height: 50,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(blurRadius: 3, color: Colors.black)],
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 2),
      ),
      alignment: Alignment.center,
      child: Text(
        "${t1.a} * ${t1.b} = ${t1.c}",
        style: TextStyle(
            fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold,letterSpacing: 10),
      ),
    );
  }

  void perform() {
    for (i = 1; i <= 10; i++) {
      print("$d $i ${i * d}");
      ans.add(table_model(a: d, b: i, c: i * d));
    }
  }
}
