


import 'package:assignment/Model/responsegetdetails.dart';
import 'package:assignment/encryption.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  Details(this.responseGetDetails,{Key? key}) : super(key: key);
 ResponseGetDetails responseGetDetails;
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DETAILS"),
      ),
      body: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Text(decrypt(widget.responseGetDetails.data.user.fullName),style: TextStyle(
              fontSize: 20
            ),),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(onPressed: (){

            },
                child:Text(
                  "LOG OUT"
                ))
          ],
        ),
      ),
    );
  }
}
