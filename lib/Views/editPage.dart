import 'package:flutter/material.dart';
import 'package:formvalidate/Models/modeldata.dart';
import 'package:formvalidate/Services/firebasefunctions.dart';
 

class EditPage extends StatefulWidget {
  EditPage({super.key, required this.formModel});
  final FormModel formModel;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  String initvalue1 = 'Account';
  String initvalue2 = 'Peon';
  static const kHeight = SizedBox(
    height: 15,
  );
  var dropdownitem1 = ['Account', 'Sales'];
  var dropdownitem2 = ['Peon', 'Manager'];

  TextEditingController empIdEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController firstNameEmpIdEditingController =
      TextEditingController();
  TextEditingController doBEditingController = TextEditingController();
  TextEditingController emailEmpIdEditingController = TextEditingController();
  TextEditingController mobileEmpIdEditingController = TextEditingController();
  TextEditingController salaryEmpIdEditingController = TextEditingController();
  @override
  void initState() {
    initvalue1 = widget.formModel.department;
    initvalue2 = widget.formModel.designation;
    empIdEditingController.text = widget.formModel.empId.toString();
    lastNameEditingController.text = widget.formModel.lastName;
    firstNameEmpIdEditingController.text = widget.formModel.firstName;
    doBEditingController.text = widget.formModel.dob.toString();
    emailEmpIdEditingController.text = widget.formModel.email;
    mobileEmpIdEditingController.text = widget.formModel.mobile.toString();
    salaryEmpIdEditingController.text = widget.formModel.salary.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text('Edit Employee Details')),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                CustomTextwidget(
                  keytype: TextInputType.number,
                  hintText: 'Emp id',
                  textEditingController: empIdEditingController,
                  optionalText: 'Auto- Generated',
                  istext: true,
                  text: 'Emp id',
                ),
                CustomTextwidget(
                    text: 'Last Name',
                    hintText: 'Last name',
                    textEditingController: lastNameEditingController),
                kHeight,
                CustomTextwidget(
                    text: 'First Name',
                    hintText: 'First name',
                    textEditingController: firstNameEmpIdEditingController),
                kHeight,
                CustomTextwidget(
                    keytype: TextInputType.number,
                    text: ' DOB',
                    hintText: 'Dob',
                    textEditingController: doBEditingController),
                kHeight,
                CustomTextwidget(
                  keytype: TextInputType.emailAddress,
                  text: 'Email',
                  hintText: 'Email',
                  textEditingController: emailEmpIdEditingController,
                  optionalText: 'Unique',
                  istext: true,
                ),
                kHeight,
                CustomTextwidget(
                    keytype: TextInputType.number,
                    text: 'Mobile',
                    hintText: 'mobile',
                    textEditingController: mobileEmpIdEditingController,
                    optionalText: 'Valid 10 digits',
                    istext: true),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Department'),
                    const SizedBox(
                      width: 20,
                    ),
                    DropdownButton(
                        value: initvalue1,
                        items: dropdownitem1.map((String items) {
                          return DropdownMenuItem(
                              value: items, child: Text(items));
                        }).toList(),
                        onChanged: ((value) {
                          setState(() {
                            initvalue1 = value!;
                          });
                        }))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Designation'),
                    const SizedBox(
                      width: 20,
                    ),
                    DropdownButton(
                        value: initvalue2,
                        items: dropdownitem2.map((String items) {
                          return DropdownMenuItem(
                              value: items, child: Text(items));
                        }).toList(),
                        onChanged: ((value) {
                          setState(() {
                            initvalue2 = value!;
                          });
                        }))
                  ],
                ),
                CustomTextwidget(
                    text: 'Salary',
                    hintText: 'Salary',
                    textEditingController: salaryEmpIdEditingController),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Firebasefunctions().updatedata(FormModel(
                              id: widget.formModel.id,
                              empId: int.parse(empIdEditingController.text),
                              lastName: lastNameEditingController.text,
                              firstName: firstNameEmpIdEditingController.text,
                              dob: double.parse(doBEditingController.text),
                              email: emailEmpIdEditingController.text,
                              mobile:
                                  int.parse(mobileEmpIdEditingController.text),
                              department: initvalue1,
                              designation: initvalue2,
                              salary: double.parse(
                                  salaryEmpIdEditingController.text)));

                          const SnackBar(content: Text('DATA ADDED'));
                          Navigator.pop(context);

                          setState(() {
                            emailEmpIdEditingController.clear();
                            emailEmpIdEditingController.clear();
                            lastNameEditingController.clear();
                            firstNameEmpIdEditingController.clear();
                            doBEditingController.clear();
                            mobileEmpIdEditingController.clear();
                            salaryEmpIdEditingController.clear();
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.purple)),
                        child: const Text("update")),
                    const SizedBox(
                      width: 20,
                    ),
                    TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.purple)),
                        child: const Text('Cancel'))
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}

class CustomTextwidget extends StatelessWidget {
  final String? optionalText;

  final String text;
  final TextInputType keytype;
  final String hintText;
  bool istext;
  final TextEditingController textEditingController;

  CustomTextwidget({
    this.keytype = TextInputType.text,
    required this.hintText,
    required this.textEditingController,
    this.istext = false,
    this.optionalText,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: textEditingController,
                keyboardType: keytype,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(), hintText: hintText),
              ),
              istext ? Text(optionalText.toString()) : Container()
            ],
          ),
        )
      ],
    );
  }
}
