import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  errorStyle: TextStyle(fontSize: 8.0,),

  hintText: 'enter the value',
  hintStyle: TextStyle(
    color: Colors.grey,

  ),
  contentPadding: EdgeInsets.symmetric( horizontal : 10.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

const transparentDecorationTextField = InputDecoration(
    contentPadding: EdgeInsets.symmetric( horizontal : 10.0),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  ),
  icon: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),

    child: Icon(
      Icons.search,
      color: Colors.grey,
    ),
  ),
  hintText: 'ما الذي تبحث عنه',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
);


