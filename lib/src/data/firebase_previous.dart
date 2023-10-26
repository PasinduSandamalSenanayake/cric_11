import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cric_11/src/model/previous_match_model.dart';
import 'package:flutter/cupertino.dart';

class Firebase_Previous{
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  List getPreviousNote (AsyncSnapshot snapshot){
    try{
      final previousNotesList = snapshot.data.docs.map((doc){
        final data = doc.data() as Map<String, dynamic>;
        return PreviousMatchNote(
          data['id'],
          data['match_leads'],
          data['date'],
          data['sri_lanka'],
          data['sri_lanka_score'],
          data['other_team'],
          data['winning_team'],
          data['other_team_score'],
          data['flag'],
          data['man_of_the_match'],
        );
      }).toList();
      return previousNotesList;
    }catch(e){
      print('error getting previous data $e');
      return [];
    }
  }

  Stream<QuerySnapshot> streamPreviousNote(){
    return _firebase.collection('previous').snapshots();
  }
}