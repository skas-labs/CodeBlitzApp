import 'dart:developer';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

class GameRepository {
  IO.Socket socket;
  String gameId;

  GameRepository(this.gameId);

  void makeConnection() {
    socket = IO.io(
        'https://game.stage.codeblitz.app',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .setQuery({'X-Game-Id': 'db264843-a8cd-4b04-ae4a-3e8754c3272e'})
            .disableForceNew()
            .disableForceNewConnection()
            .disableReconnection()
            .build());
    socket.onConnect((data) => log('connect: ${socket.id}'));
    socket.onConnectError((data) => log('error: ${data}'));
    socket.connect();
  }

  void on(String event, dynamic Function(dynamic) callback) {
    socket.on(event, callback);
  }

  void emit(String event, {dynamic Function(dynamic) callback}) {
    socket.emit(event);
  }

  void disconnect() {
    socket.disconnect();
  }
}
