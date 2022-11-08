import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:formvalidate/Services/firebasefunctions.dart';
import 'package:formvalidate/Views/editPage.dart';
import 'package:formvalidate/Views/formPage.dart';

import '../Models/modeldata.dart';


class ListDetails extends StatefulWidget {
  const ListDetails({super.key});

  @override
  State<ListDetails> createState() => _ListDetailsState();
}

class _ListDetailsState extends State<ListDetails> {
  // create instance of firebse function
  final fn = Firebasefunctions();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: StreamBuilder<List<FormModel>>(
          stream: fn.getalldata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active &&
                snapshot.data != null) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyApp(),
                              ));
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                        child: const Text(
                          'Add',
                          style: TextStyle(color: Colors.white),
                        )),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue)),
                            child: const Text(
                              'Edit',
                              style: TextStyle(color: Colors.white),
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                            onPressed: () async {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red)),
                            child: const Text(
                              'Delete',
                              style: TextStyle(color: Colors.white),
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text('ID',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text('Email',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text('Design',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final detailslist = snapshot.data![index];

                          return SizedBox(
                              width: 200,
                              child: SafeArea(
                                  child: detailsROw(
                                      updateFunction: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) => EditPage(
                                                      formModel: detailslist,
                                                    )));
                                      },
                                      deleteFunction: () async {
                                        await fn.deletedata(detailslist);
                                        fn.getalldata();
                                      },
                                      id: detailslist.empId,
                                      email: detailslist.email,
                                      design: detailslist.designation)));
                        },
                      ),
                    ),
                  ],
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    ));
  }
}

class detailsROw extends StatelessWidget {
  final int id;
  final String email;
  final String design;
  final void Function() deleteFunction;
  final void Function() updateFunction;

  detailsROw({
    required this.deleteFunction,
    required this.updateFunction,
    required this.id,
    required this.email,
    required this.design,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: updateFunction,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
            child: const Text(
              'Edit',
              style: TextStyle(color: Colors.white),
            )),
        const SizedBox(
          width: 20,
        ),
        TextButton(
            onPressed: deleteFunction,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.white),
            )),
        const SizedBox(
          width: 20,
        ),
        Text(id.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
        const SizedBox(
          width: 20,
        ),
        Text(email,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
        const SizedBox(
          width: 20,
        ),
        Text(design,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10))
      ],
    );
  }
}
