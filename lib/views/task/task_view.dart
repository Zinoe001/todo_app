import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/utils/preference_services.dart';
import 'package:todo_app/utils/texts.dart';
import 'package:todo_app/widgets/app_menu_button.dart';
import 'package:todo_app/widgets/app_text_field.dart';
import 'package:todo_app/widgets/my_list.dart';

class TaskView extends StatefulWidget {
  const TaskView({Key? key, required this.getData}) : super(key: key);
  final Function(Map<String, dynamic>) getData;

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final MyList _list = MyList();
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _hour1Controller = TextEditingController();
  final TextEditingController _hour2Controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PreferenceServices prefs = PreferenceServices();
  String? categoryValue;
  String? priorityValue = "Normal";
  String? time1Value;
  String? time2Value;
  String? time3Value;

  late DateTime _dateTime = DateTime.now();

  Future<Null> _selectedDate(BuildContext context) async {
    DateTime? _datePicker = await showDatePicker(
      initialDatePickerMode: DatePickerMode.day,
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(1947),
      lastDate: DateTime(2030),
    );
    if (_datePicker != null && _datePicker != _dateTime) {
      setState(() {
        _dateTime = _datePicker;
      });
    }
  }

  late TimeOfDay _time = TimeOfDay.now();
  Future<Null> _selectedTime(BuildContext context) async {
    TimeOfDay? _timePicker = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (_timePicker != null && _timePicker != _time) {
      setState(() {
        _time = _timePicker;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: FocusScope.of(context).unfocus,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 9.6 / 10,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 2),
                      ],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            kPrimaryColor,
                            kPrimaryLightColor,
                          ]),
                    ),
                    child: ListView(
                      padding: const EdgeInsets.all(20),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        AppText.heading1(
                          text: "Create",
                          color: Colors.white,
                        ),
                        AppText.heading1(
                          text: "Task",
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        AppText.body(
                          text: "Task",
                          color: Colors.white,
                        ),
                        AppTextField(
                          keyboardType: TextInputType.name,
                          controller: _taskController,
                          validMessage: "Textfield can't be empty",
                          hintText: "Write your task",
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AppText.body(
                          text: "Category",
                          color: Colors.white,
                        ),
                        AppTextField(
                          keyboardType: TextInputType.name,
                          controller: _categoryController,
                          validMessage: "Category can't be empty",
                          hintText: "Enter the Category",
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AppText.body(
                          text: "Date",
                          color: Colors.white,
                        ),
                        AppTextField(
                          keyboardType: TextInputType.datetime,
                          onTap: () async {
                            await _selectedDate(context);
                            setState(() {
                              _dateController.text =
                                  DateFormat.yMMMd().format(_dateTime);
                            });
                          },
                          controller: _dateController,
                          validMessage: "Date can't be empty",
                          hintText: "Enter the Date",
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText.body(
                                    text: "From",
                                    color: Colors.white,
                                  ),
                                  AppTextField(
                                    keyboardType: TextInputType.datetime,
                                    onTap: () async {
                                      await _selectedTime(context);
                                      setState(() {
                                        final time =
                                            MaterialLocalizations.of(context)
                                                .formatTimeOfDay(_time);
                                        _hour1Controller.text = time;
                                      });
                                    },
                                    controller: _hour1Controller,
                                    validMessage: "Time can't be empty",
                                    hintText: "Enter the Time",
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              height: 3,
                              width: 10,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText.body(
                                    text: "To",
                                    color: Colors.white,
                                  ),
                                  AppTextField(
                                    keyboardType: TextInputType.datetime,
                                    onTap: () async {
                                      await _selectedTime(context);
                                      setState(() {
                                        final time2 =
                                            MaterialLocalizations.of(context)
                                                .formatTimeOfDay(_time);
                                        _hour2Controller.text = time2;
                                      });
                                    },
                                    controller: _hour2Controller,
                                    validMessage: "Time can't be empty",
                                    hintText: "Enter the Time",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: MenuButton(
                                  value: priorityValue,
                                  item: _list.priority,
                                  hintText: "Add Priority",
                                  onChanged: (value) {
                                    setState(() {
                                      priorityValue = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              widget.getData(
                                
                                {
                                  "text": _taskController.text,
                                  "category": _categoryController.text,
                                  "priority": priorityValue,
                                  "date": _dateController.text,
                                  "time":
                                      "${_hour1Controller.text} - ${_hour2Controller.text} ",
                                },
                              );
                              Navigator.pop(context);
                            }

                          },
                          child: Center(
                            child: Container(
                              height: 45,
                              width: 225,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: AppText.heading5(text: "ADD TASK"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
