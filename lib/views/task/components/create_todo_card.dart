import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/utils/texts.dart';
import 'package:todo_app/views/task/components/date_time_card.dart';
import 'package:todo_app/widgets/app_menu_button.dart';
import 'package:todo_app/widgets/app_text_field.dart';
import 'package:todo_app/widgets/my_list.dart';
import 'package:todo_app/widgets/todo_snackbar.dart';

class CreateTodoCard extends StatefulWidget {
  CreateTodoCard({
    Key? key,
    required this.getTask,
  }) : super(key: key);

  final Function(Map<String, dynamic>) getTask;

  @override
  State<CreateTodoCard> createState() => _CreateTodoCardState();
}

class _CreateTodoCardState extends State<CreateTodoCard> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  String? dateTime;
  String? time1;
  String? time2;
  String? priority = "Normal";

  late DateTime _dateTime = DateTime.now();
  Future<Null> _selectedDate() async {
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
  Future<Null> _selectedTime() async {
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final MyList list = MyList();
  final TodoFlushbar snackbar = TodoFlushbar();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.body(
            text: "Task",
            color: Colors.white,
          ),
          AppTextField(
            keyboardType: TextInputType.name,
            controller: controller1,
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
            controller: controller2,
            validMessage: "Category can't be empty",
            hintText: "Enter the Category",
          ),
          const SizedBox(
            height: 16,
          ),
          DateTimeCard(
            title: "Date",
            icon: Icons.calendar_month_outlined,
            time: dateTime,
            size: 35,
            message: "Select day",
            onTap: () async {
              await _selectedDate();
              setState(() {
                dateTime = DateFormat.yMMMd().format(_dateTime);
              });
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: DateTimeCard(
                  title: "From",
                  icon: Icons.alarm_add_outlined,
                  size: 20,
                  time: time1,
                  message: "Enter the time",
                  onTap: () async {
                    await _selectedTime();
                    setState(() {
                      final time0 = MaterialLocalizations.of(context)
                          .formatTimeOfDay(_time);
                      time1 = time0;
                      _dateTime = DateTime(_dateTime.year, _dateTime.month,
                          _dateTime.day, _time.hour, _time.minute);
                    });
                  },
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
                child: DateTimeCard(
                  title: "To",
                  icon: Icons.alarm_add_outlined,
                  size: 20,
                  time: time2,
                  message: "Enter the time",
                  onTap: () async {
                    await _selectedTime();
                    setState(() {
                      final time1 = MaterialLocalizations.of(context)
                          .formatTimeOfDay(_time);
                      time2 = time1;
                    });
                  },
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
                    priority: priority,
                    hintText: "Add Priority",
                    onChanged: (value) {
                      setState(() {
                        priority = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                print("validating time");
                if (dateTime == null) {
                  snackbar.showError(context,
                      title: "No Date Selected",
                      message: "You have not selected a date");
                } else if (time1 == null) {
                  snackbar.showError(context,
                      title: "No Time Selected",
                      message: "You have not selected a start time");
                } else if (time2 == null) {
                  snackbar.showError(context,
                      title: "No Time Selected",
                      message: "You have not selected an end time");
                } else {
                  Navigator.pop(context);
                  snackbar.showSuccessful(context,
                      title: "Todo Created",
                      message:
                          "You have succesfully created your todo for $dateTime");
                  widget.getTask(
                    {
                      "text": controller1.text,
                      "category": controller2.text,
                      "priority": priority,
                      "date": _dateTime.millisecondsSinceEpoch,
                      "time": "${time1} - ${time2}", 
                    },
                  );
                }
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
    );
  }
}
