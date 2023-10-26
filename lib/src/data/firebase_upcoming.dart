import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/upcoming_match_model.dart';

class Firebase_Upcoming{

  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  List getUpcomingNote (AsyncSnapshot snapshot){
    try{
      final upcomingNotesList = snapshot.data.docs.map((doc){
        final data = doc.data() as Map<String, dynamic>;
        return UpComingMatchNote(
          data['id'],
          data['matchStatus'],
          data['matchDate'],
          data['Sri_Lanka'],
          data['Other_Team'],
          data['time'],
          data['location'],
          data['flag'],
        );
      }).toList();
      return upcomingNotesList;
    }catch(e){
      print('error getting upcoming data $e');
      return [];
    }
  }

  Stream<QuerySnapshot> upcomingStream(){
    return _firebase.collection('upcoming').snapshots();
  }

}