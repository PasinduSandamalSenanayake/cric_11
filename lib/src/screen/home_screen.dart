import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cric_11/src/const/color.dart';
import 'package:cric_11/src/data/firebase_live.dart';
import 'package:cric_11/src/data/firebase_previous.dart';
import 'package:cric_11/src/data/firebase_upcoming.dart';
import 'package:cric_11/src/widgets/live_match_widget.dart';
import 'package:cric_11/src/widgets/previous_match_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/upcoming_match_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'images/logo/cric11_white.png',
          height: 25,
          width: 25,
        ),
        centerTitle: true,
        title: Text(
            "Cric 11",
        ),

        backgroundColor: custom_blue,
      ),
        body: SafeArea(
          // child: Column(
          //   children: [
              child: StreamBuilder<QuerySnapshot>(
                stream: Firebase_Previous().streamPreviousNote(),
                builder: (context, previousSnapshot) {
                  if (!previousSnapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final previousNoteList = Firebase_Previous().getPreviousNote(previousSnapshot);

                  return StreamBuilder<QuerySnapshot>(
                    stream: Firebase_Live().liveStream(), // Use the stream for Live Match
                    builder: (context, liveSnapshot) {
                      if (!liveSnapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final liveNoteList = Firebase_Live().getLiveNote(liveSnapshot);

                      return StreamBuilder<QuerySnapshot>(
                          stream: Firebase_Upcoming().upcomingStream(),
                          builder: (context, upcomingSnapshot){
                            if(!upcomingSnapshot.hasData){
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final upcomingNoteList = Firebase_Upcoming().getUpcomingNote(upcomingSnapshot);
                            return ListView.builder(
                              itemCount: previousNoteList.length + liveNoteList.length + upcomingNoteList.length,
                              itemBuilder: (context, index) {
                                if (index < previousNoteList.length) {
                                  final note = previousNoteList[index];
                                  return PreviousMatchWidget(note);
                                } else if(index < previousNoteList.length + liveNoteList.length){
                                  final liveIndex = index - previousNoteList.length;
                                  final liveNote = liveNoteList[liveIndex];
                                  return LiveMatchWidget(liveNote);
                                } else {
                                  final upcomingIndex = index - previousNoteList.length - liveNoteList.length;
                                  final upcomingNote = upcomingNoteList[upcomingIndex];
                                  return UpcomingMatchWidget(upcomingNote);
                                }

                              },
                            );
                          }
                      );

                      // return ListView.builder(
                      //   itemCount: previousNoteList.length + liveNoteList.length,
                      //   itemBuilder: (context, index) {
                      //     // int plength = previousNoteList.length;
                      //     // int llength = liveNoteList.length;
                      //     // print("INDEX __________________________________________________ $index");
                      //     // print("previous length __________________________________________________ $plength");
                      //     // print("live length __________________________________________________ $llength");
                      //     if (index < previousNoteList.length) {
                      //       //print("INDEX 1 __________________________________________________ $index");
                      //       final note = previousNoteList[index];
                      //       return PreviousMatchWidget(note);
                      //     } else {
                      //       //print("INDEX LIVE PART __________________________________________________ $index");
                      //       final liveIndex = index - previousNoteList.length;
                      //
                      //       //print("LIVE INDEX __________________________________________________ $liveIndex");
                      //       final liveNote = liveNoteList[liveIndex];
                      //       return LiveMatchWidget(liveNote);
                      //     }
                      //   },
                      // );
                    },
                  );
                },
              ),
          //   ],
          // ),
        )


    );
  }
}
