import 'package:flutter/material.dart';
import 'package:split_the_bill/constants.dart';
import 'package:split_the_bill/views/participants_list.dart';

class NewBillBody extends StatefulWidget {
  const NewBillBody({Key? key}) : super(key: key);

  @override
  _NewBillBodyState createState() => _NewBillBodyState();
}

class _NewBillBodyState extends State<NewBillBody> {
  late DateTime _billTime;
  late TextEditingController _placeNameController, _eventNameController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _billTime = DateTime.now();
    _placeNameController = TextEditingController();
    _eventNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// event input
              Row(
                children: [
                  const Text('Event: '),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Event name',
                      ),
                      controller: _eventNameController,
                    ),
                  ),
                ],
              ),

              /// location input
              Row(
                children: [
                  const Text('Location: '),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Event location',
                      ),
                      controller: _placeNameController,
                    ),
                  ),
                ],
              ),

              /// date & time
              Row(
                children: [
                  const Text('Date & time: '),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      initialValue: dateFormat.format(_billTime).toString(),
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 30,
              ),

              /// participants
              Expanded(
                child: ParticipantsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _eventNameController.dispose();
    _placeNameController.dispose();
    super.dispose();
  }
}
