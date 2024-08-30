import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'WebSocket Demo';
    return const MaterialApp(
      title: title,
      home: MyHomePage(
        title: title,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  // final _channel = WebSocketChannel.connect(
  //   Uri.parse('wss://10.0.2.2:6001/laravel-websockets'),

  // );
  final channel =
      IOWebSocketChannel.connect('wss://10.0.2.2:8000/laravel-websockets');
  String receivedEvent = '';
  // IOWebSocketChannel.connect('wss://127.0.0.1:6001/laravel-websockets');
  // http://127.0.0.1:8000/laravel-websockets

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body:
//           // Container()
//           Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Form(
//               child: TextFormField(
//                 controller: _controller,
//                 decoration: const InputDecoration(labelText: 'Send a message'),
//               ),
//             ),
//             const SizedBox(height: 24),
//             StreamBuilder(
//               stream: _channel.stream,
//               builder: (context, snapshot) {
//                 print(snapshot.data);
//                 return Text(snapshot.hasData ? '${snapshot.data} --' : '');
//               },
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _sendMessage,
//         tooltip: 'Send message',
//         child: const Icon(Icons.send),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }

//   void _sendMessage() {
//     if (_controller.text.isNotEmpty) {
//       _channel.sink.add(_controller.text);
//     }
//   }

//   @override
//   void dispose() {
//     _channel.sink.close();
//     _controller.dispose();
//     super.dispose();
//   }
// // }
//   @override
//   void initState() {
//     super.initState();
//     channel.stream.listen(
//       (event) {
//         setState(() {
//           receivedEvent = event.toString();
//         });
//       },
//       onError: (error) {
//         print('Error occurred: $error');
//       },
//       onDone: () {
//         print('Connection closed');
//       },
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebSocket Example'),
      ),
      body: StreamBuilder(
        stream: channel.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            String event = snapshot.data.toString();
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Received Event:',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    event,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error occurred: ${snapshot.error}',
                style: TextStyle(fontSize: 18),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
