import 'package:Habo/provider.dart';
import 'package:Habo/widgets/text_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateHabitScreen extends StatefulWidget {
  @override
  _CreateHabitScreenState createState() => _CreateHabitScreenState();
}

class _CreateHabitScreenState extends State<CreateHabitScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController cue = TextEditingController();
  TextEditingController routine = TextEditingController();
  TextEditingController reward = TextEditingController();
  TimeOfDay notTime = TimeOfDay(hour: 12, minute: 0);
  bool twoDayRule = false;
  bool showReward = false;
  bool advanced = false;
  bool notification = false;

  Future<void> setNotificationTime(context) async {
    TimeOfDay selectedTime;
    TimeOfDay initialTime = notTime;
    selectedTime = await showTimePicker(
        context: context,
        initialTime: (initialTime != null)
            ? initialTime
            : TimeOfDay(hour: 20, minute: 0));
    if (selectedTime != null) {
      setState(
        () {
          notTime = selectedTime;
        },
      );
    }
  }

  @override
  void dispose() {
    title.dispose();
    cue.dispose();
    routine.dispose();
    reward.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Create Habit',
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: Theme.of(context).iconTheme,
      ),
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FloatingActionButton(
          onPressed: () {
            if (title.text.length != 0) {
              Provider.of<Bloc>(context, listen: false).addHabit(
                  title.text.toString(),
                  twoDayRule,
                  cue.text.toString(),
                  routine.text.toString(),
                  reward.text.toString(),
                  showReward,
                  advanced,
                  notification,
                  notTime);
              Navigator.of(context).pop();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  behavior: SnackBarBehavior.floating,
                  content: Text("The habit title can not be empty."),
                ),
              );
            }
          },
          child: Icon(
            Icons.check,
            semanticLabel: 'Save',
            color: Colors.white,
            size: 35.0,
          ),
        );
      }),
      body: Builder(
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  TextContainer(
                    title: title,
                    hint: 'Exercise',
                    label: 'Habit',
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          onChanged: (bool value) {
                            setState(
                              () {
                                twoDayRule = value;
                              },
                            );
                          },
                          value: twoDayRule,
                        ),
                        Text(
                          "Use Two day rule",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Tooltip(
                          child: Icon(
                            Icons.info,
                            color: Colors.grey,
                            size: 18,
                          ),
                          message:
                              "With two day rule, you can miss one day and do not lose a streak if the next day is successful.",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ExpansionTile(
                      title: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text(
                          "Advanced habit building",
                          style: TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onExpansionChanged: (bool value) {
                        advanced = value;
                      },
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: Text(
                              "This section helps you better define your habits. You should define cue, routine, and reward for every habit.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextContainer(
                          title: cue,
                          hint: 'e.g. At 7:00AM',
                          label: 'Cue',
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 25),
                          title: Text(
                            "Notifications",
                            style: TextStyle(
                              fontSize: 23,
                            ),
                          ),
                          trailing: Switch(
                            value: notification,
                            onChanged: (value) {
                              notification = value;
                              setState(() {});
                            },
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 25),
                          enabled: notification,
                          title: Text(
                            "Notification time",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          trailing: InkWell(
                            onTap: () {
                              if (notification) {
                                setNotificationTime(context);
                              }
                            },
                            child: Text(
                              notTime.hour.toString().padLeft(2, '0') +
                                  ":" +
                                  notTime.minute.toString().padLeft(2, '0'),
                              style: TextStyle(
                                  color: (notification)
                                      ? null
                                      : Theme.of(context).disabledColor),
                            ),
                          ),
                        ),
                        TextContainer(
                          title: routine,
                          hint: 'e.g. Do 50 push ups',
                          label: 'Routine',
                        ),
                        TextContainer(
                          title: reward,
                          hint: 'e.g. 15 min. of video games',
                          label: 'Reward',
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          child: Row(
                            children: <Widget>[
                              Checkbox(
                                onChanged: (bool value) {
                                  setState(
                                    () {
                                      showReward = value;
                                    },
                                  );
                                },
                                value: showReward,
                              ),
                              Text(
                                "Show reward",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Tooltip(
                                child: Icon(
                                  Icons.info,
                                  semanticLabel: 'Tooltip',
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                message:
                                    "The remainder of the reward after a successful routine.",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
