import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

String formatarData(String dataUTC) {
  DateTime data =
      DateTime.parse(dataUTC).toLocal(); // Converter para hora local
  DateFormat formato = DateFormat('dd/MM/yyyy HH:mm');
  String dataFormatada = formato.format(data);
  return dataFormatada;
}

bool compareToLowerCaseAndTrim(String a, String b) {
  return a.toLowerCase().trim() == b.toLowerCase().trim();
}

String enumToName(Enum? value, List<Map> enums) {
  String retorno = '-';
  if (value == null) {
    return retorno;
  }
  for (var element in enums) {
    if (element['value'] == value) {
      retorno = element['name'];
      continue;
    }
  }
  return retorno;
}

String firtsLastName(String nomeCompleto) {
  final nomeArray = nomeCompleto.split(' ');

  return '${nomeArray[0]} ${nomeArray[nomeArray.length - 1]}';
}

String truncarTexto(String texto) {
  if (texto.length > 35) {
    return "${texto.substring(0, 35)}...";
  }
  return texto;
}

String abreviacao(String string) {
  var array = string.trim().split(" ");
  print(array);

  if (array.length == 1) {
    if (array[0].isEmpty) {
      return "";
    }
    return array[0][0].toUpperCase();
  }
  return "${array[0][0]}${array[array.length - 1][0]}".toUpperCase();
}

String getTextAfterLastSlash(String territorio) {
  int lastSlashIndex = territorio.lastIndexOf('/');
  if (lastSlashIndex != -1 && lastSlashIndex < territorio.length - 1) {
    return territorio.substring(lastSlashIndex + 1);
  } else {
    // Caso não haja barra no texto ou seja a última característica, retorna o próprio texto.
    return territorio;
  }
}

String substituirTresPrimeirosGruposPorAsteriscos(String numeros) {
  if (numeros.length != 16) {
    return "A string deve conter exatamente 16 dígitos.";
  }

  List<String> grupos = [];
  for (int i = 0; i < 16; i += 4) {
    if (i < 12) {
      grupos.add('****');
    } else {
      String grupo = numeros.substring(i, i + 4);
      grupos.add(grupo);
    }
  }

  return grupos.join(' ');
}

String hideLastName(String fullName) {
  if (fullName.isEmpty) {
    return fullName;
  }

  // Procura o último espaço na string para separar nome e sobrenome
  int lastSpaceIndex = fullName.lastIndexOf(' ');

  // Se não houver espaço na string, apenas retorne a string original
  if (lastSpaceIndex == -1) {
    return fullName;
  }

  // Obtém o nome e o sobrenome
  String firstName = fullName.substring(0, lastSpaceIndex);
  String lastName = fullName.substring(lastSpaceIndex + 1);

  // Determina quantos caracteres do sobrenome devem ser escondidos
  int charsToHide = 0;
  if (fullName.length > 10) {
    charsToHide = 6;
  } else {
    charsToHide = 4;
  }

  // Calcula a parte do sobrenome a ser escondida
  String hiddenPart = '*' * charsToHide;

  // Cria o nome com o sobrenome parcialmente escondido
  String partiallyHiddenName =
      '$firstName ${lastName.substring(0, charsToHide).replaceAll(RegExp(r'[^ ]'), '*')}';

  return partiallyHiddenName;
}

Color adjustShade(Color color, int shade) {
  final int r = color.red + shade > 255 ? 255 : color.red + shade;
  final int g = color.green + shade > 255 ? 255 : color.green + shade;
  final int b = color.blue + shade > 255 ? 255 : color.blue + shade;
  return Color.fromARGB(color.alpha, r, g, b);
}

String limitTo14Words(String text) {
  List<String> words = text.split(' ');
  if (words.length <= 14) {
    return text;
  } else {
    List<String> first14Words = words.sublist(0, 14);
    return '${first14Words.join(' ')}...';
  }
}

String addEllipsis(String inputString, int maxLength) {
  if (inputString.length <= maxLength) {
    return inputString; // A string já é curta o suficiente, não é necessário adicionar reticências.
  }
  return inputString.substring(0, maxLength) + "...";
}

String formatDateTime(DateTime dateTime) {
  final formatter = DateFormat('dd/MM/yy');
  return formatter.format(dateTime);
}

String formatTimeOfDay(TimeOfDay timeOfDay) {
  final hours = timeOfDay.hour.toString().padLeft(2, '0');
  final minutes = timeOfDay.minute.toString().padLeft(2, '0');
  return '$hours:$minutes';
}

DateTime sumDateTimeAndTimeOfDay(DateTime dateTime, TimeOfDay timeOfDay) {
  final hour = timeOfDay.hour;
  final minute = timeOfDay.minute;
  final newDateTime =
      DateTime(dateTime.year, dateTime.month, dateTime.day, hour, minute);
  return newDateTime;
}

Future<String?> uploadFile(File file) async {
  String fileName = path.basename(file.path);

  // Criar uma referência ao arquivo que será enviado
  Reference ref = FirebaseStorage.instance.ref().child(fileName);

  // Enviar o arquivo para o Firebase Storage
  UploadTask uploadTask = ref.putFile(file);

  // Aguardar o fim do upload
  await uploadTask;

  // Obter a URL do arquivo enviado
  String? fileUrl = await ref.getDownloadURL();

  return fileUrl;
}
