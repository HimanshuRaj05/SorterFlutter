import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _myController = TextEditingController();
  List<int> newArr = [];
  String myText = '';

  String insertionSort(List<int> arr, int n) {
    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j <= n - i - 2; j++) {
        if (arr[j + 1] < arr[j]) {
          int temp = arr[j + 1];
          arr[j + 1] = arr[j];
          arr[j] = temp;
        }
      }
    }

    String stringToReturn = '';

    for (int i = 0; i < n; i++) {
      stringToReturn += arr[i].toString() + ' ';
    }
    return stringToReturn;
  }

  void generateSortedArray() {
    String arrStr = _myController.text;
    int n = arrStr.length;

    //Convert arrStr to int of list
    List<int> nums = [];

    String newString = '';

    for (int i = 0; i < n; i++) {
      print('Ch1');
      String charStr = arrStr[i];

      if (charStr == ',') {
        nums.add(int.parse(newString));
        newString = '';
      } else if (i == n - 1) {
        newString += charStr;
        nums.add(int.parse(newString));
      } else {
        newString += charStr;
      }
    }

    //then call insertion sort which returns sorted space separated string

    String finalString = insertionSort(nums, nums.length);

    //finall show the returned string in text widget

    setState(() {
      myText = finalString;
    });
    //this widget takes myText string
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Sorter',
          style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: _myController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '  Enter comma separated array...',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                  borderRadius: BorderRadius.circular(20)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          'Sorted Array',
          style: TextStyle(
              color: Colors.white60, fontWeight: FontWeight.w600, fontSize: 19),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          myText,
          style: TextStyle(
              color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 20),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () {
              generateSortedArray();
            },
            child: Container(
              width: double.maxFinite,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(19)),
              child: Center(
                child: Text(
                  'Sort',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: Colors.white60),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
