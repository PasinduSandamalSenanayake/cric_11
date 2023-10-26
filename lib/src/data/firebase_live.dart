
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../model/live_match_model.dart';

class Firebase_Live{
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  List getLiveNote(AsyncSnapshot snapshot){
    try{
      final liveNotesList = snapshot.data.docs.map((doc){
        final data = doc.data() as Map<String, dynamic>;
        return LiveMatchNote(
          data['id'],
          data['live_state'],
          data['sri_lanka_score'],
          data['sri_lanka_over'],
          data['other_team_score'],
          data['other_team_over'],
          data['flag'],
          data['toss_status'],
        );
      }).toList();
      return liveNotesList;
    }catch(e){
      print('error getting live data $e');
      return [];
    }
  }

  Stream<QuerySnapshot> liveStream(){
    return _firebase.collection('live').snapshots();
  }

}