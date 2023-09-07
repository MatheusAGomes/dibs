import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  enums.forEach((element) {
    if (element['value'] == value) {
      retorno = element['name'];
      return;
    }
  });
  return retorno;
}

String firtsLastName(String nomeCompleto) {
  final nomeArray = nomeCompleto.split(' ');

  return '${nomeArray[0]} ${nomeArray[nomeArray.length - 1]}';
}

String truncarTexto(String texto) {
  if (texto.length > 35) {
    return texto.substring(0, 35) + "...";
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

String obscureName(String fullName) {
  if (fullName == null || fullName.isEmpty) {
    return fullName;
  }

  // Determina quantos caracteres devem ser obscurecidos (aqui, estamos obscurecendo os últimos 4 caracteres)
  int obscureCount = 4;

  // Obtém o comprimento da string
  int length = fullName.length;

  // Verifica se o comprimento é menor que a quantidade de caracteres a serem obscurecidos
  if (length <= obscureCount) {
    return '*' * length; // Retorna asteriscos do mesmo comprimento que a string
  }

  // Pega os primeiros caracteres da string e adiciona asteriscos para obscurecer o restante
  String obscured =
      fullName.substring(0, length - obscureCount) + '*' * obscureCount;

  return obscured;
}

void main() {
  String nomeCompleto = "John Doe";
  String nomeObscurecido = obscureName(nomeCompleto);
  print(nomeObscurecido); // Saída: "John ***"
}
