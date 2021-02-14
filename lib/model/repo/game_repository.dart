import 'package:socket_io_client/socket_io_client.dart' as IO;

class GameRepository {
  IO.Socket socket;

  GameRepository() {
    socket = IO.io(
        'https://game.stage.codeblitz.app',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .disableForceNew()
            .disableForceNewConnection()
            .disableReconnection()
            .build());
  }

  void makeConnection() {
    socket.connect();
  }

  void disconnect() {
    socket.disconnect();
  }
}
