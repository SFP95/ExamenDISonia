import 'package:cloud_firestore/cloud_firestore.dart';

class NewCart{
  final String? image;
  final int? members;
  final String? name;
  final List<DocumentReference>? rooms;

  NewCart({
    this.image="",
    this.members=0,
    this.name="",
    this.rooms=const[],
  });

  factory NewCart.fromFirestore(
      DocumentSnapshot<Map<String,dynamic>> snapshot,
      SnapshotOptions? options,
      ){
    final data = snapshot.data();
    return NewCart(
    image:data?['image'],
    members:data?['members'],
    name:data?['name'],
    rooms: data?['rooms']is Iterable ? List.from(data?["rooms"]):null,
    );
  }

  Map <String,dynamic> toFirestore(){
    return{
      if(image!=null)"image":image,
      if(members!=null)"members":members,
      if(name!=null)"name":name,
      if(rooms!.isNotEmpty)"rooms":rooms,
    };
  }
}