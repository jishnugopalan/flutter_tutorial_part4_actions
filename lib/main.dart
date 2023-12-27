import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Actions",
      home: MainPage(),
    );

  }
}
class MainPage extends StatelessWidget {
   const MainPage({Key? key}) : super(key: key);
  onPressed() {
    print("Pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Actions"),backgroundColor: Colors.blueAccent,),
      body: Column(


        children: [
        ElevatedButton(onPressed: onPressed, child: const Text('Elevated')),
        FilledButton(onPressed: onPressed, child: const Text('Filled')),
        FilledButton.tonal(
            onPressed: onPressed, child: const Text('Filled Tonal')),
        OutlinedButton(onPressed: onPressed, child: const Text('Outlined')),
        TextButton(onPressed: onPressed, child: const Text('Text')),
        FloatingActionButton.extended(onPressed: onPressed,label: Text("Add"),icon: Icon(Icons.add),),
        IconButton(onPressed: onPressed, icon: Icon(Icons.volume_up,color: Colors.blue,)),
        IconButton.filled(
            onPressed: onPressed, icon: const Icon(Icons.filter_drama)),

        // Filled tonal icon button
        IconButton.filledTonal(
            onPressed: onPressed, icon: const Icon(Icons.filter_drama)),

        // Outlined icon button
        IconButton.outlined(
            onPressed: onPressed, icon: const Icon(Icons.filter_drama)),
          SegmentationButton(),
          MultipleChoice()
      ],),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.green,onPressed: (){},child: Icon(Icons.add,color: Colors.white,),),
    );
  }
}
enum Calendar { day, week, month, year }
//single choice
class SegmentationButton extends StatefulWidget {
  const SegmentationButton({Key? key}) : super(key: key);

  @override
  State<SegmentationButton> createState() => _SegmentationButtonState();
}

class _SegmentationButtonState extends State<SegmentationButton> {

  Calendar calendarView = Calendar.day;
  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
            value: Calendar.day,
            label: Text('Day'),
            icon: Icon(Icons.calendar_view_day)),
        ButtonSegment<Calendar>(
            value: Calendar.week,
            label: Text('Week'),
            icon: Icon(Icons.calendar_view_week)),
        ButtonSegment<Calendar>(
            value: Calendar.month,
            label: Text('Month'),
            icon: Icon(Icons.calendar_view_month)),
        ButtonSegment<Calendar>(
            value: Calendar.year,
            label: Text('Year'),
            icon: Icon(Icons.calendar_today)),
      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          calendarView = newSelection.first;
        });
      },
    );
  }
}

//multiple choice
enum Sizes { extraSmall, small, medium, large, extraLarge }

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>(
      segments: const <ButtonSegment<Sizes>>[
        ButtonSegment<Sizes>(value: Sizes.extraSmall, label: Text('XS')),
        ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
        ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
        ButtonSegment<Sizes>(
          value: Sizes.large,
          label: Text('L'),
        ),
        ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text('XL')),
      ],
      selected: selection,
      onSelectionChanged: (Set<Sizes> newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}


