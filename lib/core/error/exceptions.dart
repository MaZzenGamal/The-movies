import 'package:the_movies/core/network/error_message_model.dart';

class ServerExceptions implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerExceptions({required this.errorMessageModel});

}
