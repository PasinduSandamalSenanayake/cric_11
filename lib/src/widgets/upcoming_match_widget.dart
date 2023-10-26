import 'package:cric_11/src/model/upcoming_match_model.dart';
import 'package:flutter/material.dart';

class UpcomingMatchWidget extends StatefulWidget {
  UpComingMatchNote upComingMatchNote;
  UpcomingMatchWidget(this.upComingMatchNote,{super.key});

  @override
  State<UpcomingMatchWidget> createState() => _UpcomingMatchWidgetState();
}

class _UpcomingMatchWidgetState extends State<UpcomingMatchWidget> {
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
                match_date(),
                sl(),
                otherCountry(),
                time(),
                //location(),
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
              widget.upComingMatchNote.matchStatus,
              //"Match Status",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              widget.upComingMatchNote.date,
              //"Date",
              style: Theme.of(context).textTheme.bodyText2,
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
              widget.upComingMatchNote.sl,
              //"Sri Lanka",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }

  Widget otherCountry(){
    return Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 50,
                decoration: BoxDecoration(
                  //color: Colors.green,
                  image: DecorationImage(
                    image: AssetImage('images/flags/${widget.upComingMatchNote.flag}.png'),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Text(
                widget.upComingMatchNote.otherCountry,
                //"Other Country",
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        )
    );
  }

  Widget time() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.upComingMatchNote.time,
              //"Time",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              widget.upComingMatchNote.location,
              //"Location",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }

  Widget location() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.upComingMatchNote.location,
            //"Location",
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
