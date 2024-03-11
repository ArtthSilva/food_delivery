import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatUser user = ChatUser(id: "1", firstName: "Eu");
  ChatUser bot = ChatUser(id: "2", firstName: " ");
  List<ChatMessage> allMassages = [];
  List<ChatUser> typing=[];

  final ourUrl="https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=API_KEY";
  final header={
    'Content-Type': 'application/json'
  };

  getData(ChatMessage m) async {
    typing.add(bot);
    allMassages.insert(0, m);
    setState(() {

    });
    var data={"contents":[{"parts":[{"text":m.text}]}],
    
     };

    await http.post(Uri.parse(ourUrl),headers: header,body: jsonEncode(data)).
    then((value){
      if(value.statusCode==200){
        var result=jsonDecode(value.body);
        print(data);
        print(result["candidates"][0]["content"]["parts"][0]["text"]);
        ChatMessage m1=ChatMessage(
            user: bot,
            createdAt: DateTime.now(),
          text: result["candidates"][0]["content"]["parts"][0]["text"],
        );
        allMassages.insert(0, m1);

      }else{
        print("Error occurred");
      }
    }).
    catchError((e){});
    typing.remove(bot);
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text('Chef Receitinhas', style: TextStyle(color: Colors.white),),
        leading: IconButton(onPressed: () => Modular.to.navigate('/'), icon: const Icon(Icons.arrow_back_ios, color: Colors.white,)),
      ),
       body: Container(
   width: double.infinity,
  decoration: const BoxDecoration(

    image: DecorationImage(
        image: AssetImage("assets/images/chat-background-img.png"),
        fit: BoxFit.cover),
  ),
         child: DashChat(
         
          messageOptions:const MessageOptions(
            currentUserTextColor: Colors.white,
            currentUserTimeTextColor: Colors.white,
            currentUserContainerColor: Colors.green,
            showTime: true,
            textColor: Colors.white,
            containerColor: Colors.red
          ),
          typingUsers: typing,
          currentUser: user,
          onSend: (ChatMessage m) {
            getData(m);
          },
          messages: allMassages,
               ),
       ),
    );
  }
}