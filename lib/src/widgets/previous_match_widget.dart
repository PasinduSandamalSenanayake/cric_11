import 'package:flutter/material.dart';

import '../model/previous_match_model.dart';

class PreviousMatchWidget extends StatefulWidget {
  PreviousMatchNote previousMatchNote;
  PreviousMatchWidget(this.previousMatchNote,{super.key});

  @override
  State<PreviousMatchWidget> createState() => _PreviousMatchWidgetState();
}

class _PreviousMatchWidgetState extends State<PreviousMatchWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              children: [
                match_date(), // match date and lead status
                sl(),
                otherCountry(),
                winning_status(), // winning status and edit buttom
              ],
            )
        ),
      ),
    );
  }
  Widget match_date(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.previousMatchNote.matchLeads,
              //"ODI 1 of 3(SL leads 1-0)",
              style: Theme.of(context).textTheme.bodyText2,
              // style: TextStyle(
              //   color: Colors.black,
              //   fontSize: 18,
              // ),
            ),
            Text(
              widget.previousMatchNote.date,
              //"Thu,Sep 23",
              style: Theme.of(context).textTheme.bodyText2,
              // style: TextStyle(
              //   color: Colors.black,
              //   fontSize: 18,
              // ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sl(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(

              children: [
            Container(
              height: 30,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('images/flags/1.png'), // fix image
                ),
              ),
            ),
            SizedBox(width: 10,),
            Text(
              widget.previousMatchNote.sl, // sri lanka name of the match
              //"Sri lanka",
              style: Theme.of(context).textTheme.subtitle2,
              // style: TextStyle(
              //   color: Colors.black,
              //   fontSize: 18,
              //),
            ),
              ],
            ),
            Text(
              widget.previousMatchNote.slScore, // sri lanka score of the match
              //"313/7",
              style: Theme.of(context).textTheme.subtitle2,
              // style: TextStyle(
              //   color: Colors.black,
              //   fontSize: 18,
              //),
            ),
          ],
        ),
      ),
    );
  }

  Widget otherCountry(){
    return Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
              Container(
                height: 30,
                width: 50,
                decoration: BoxDecoration(
                  //color: Colors.green,
                  image: DecorationImage(
                    image: AssetImage('images/flags/${widget.previousMatchNote.flag}.png'),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Text(
                widget.previousMatchNote.otherTeam, // another country name
                //"India",
                style: Theme.of(context).textTheme.subtitle2,
                // style: TextStyle(
                //   color: Colors.black,
                //   fontSize: 18,
                //),
              ),
                ],
              ),
              Text(
                widget.previousMatchNote.otScore, // another country score
                //"263/9",
                style: Theme.of(context).textTheme.subtitle2,
                // style: TextStyle(
                //   color: Colors.black,
                //   fontSize: 18,
                // ),
              ),
            ],
          ),
        )
    );
  }

  Widget winning_status() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            Text(
              widget.previousMatchNote.winningTeam, // winning team
              //"Sri lanka won the match by 50 runs",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
