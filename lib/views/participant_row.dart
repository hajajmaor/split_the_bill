import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:split_the_bill/main.dart';
import 'package:split_the_bill/models/participant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ParticipantRow extends StatefulWidget {
  const ParticipantRow({
    Key? key,
    required this.part,
    // required this.index,
  }) : super(key: key);
  final Participant part;
  // final int index;
  @override
  _ParticipantRowState createState() => _ParticipantRowState();
}

class _ParticipantRowState extends State<ParticipantRow> {
  late final TextEditingController _name, _howMuch;
  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.part.name);
    _howMuch = TextEditingController(text: widget.part.howMuch?.toString());
  }

  double calculatePriceWithService() {
    final result = double.tryParse(_howMuch.value.text) ?? 0;
    return result * 1.1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 100,
      decoration: BoxDecoration(
        color: widget.part.payed ?? false ? Colors.green[200] : Colors.red[200],
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              context.read(participantStateProvider).remove(widget.part);
            },
            icon: const Icon(Icons.remove_circle_outline_outlined),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Name',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                width: 100,
                child: TextFormField(
                  onChanged: (value) => widget.part.name = value,
                  decoration: const InputDecoration(
                    hintText: 'Name',
                  ),
                  keyboardType: TextInputType.text,
                  controller: _name,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'How Much?',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    hintText: '23.5\$',
                  ),
                  keyboardType: TextInputType.number,
                  controller: _howMuch,
                  onChanged: (value) {
                    setState(() {
                      widget.part.howMuch = double.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '+Tip',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    calculatePriceWithService().toStringAsFixed(1),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
            child: Checkbox(
              value: widget.part.payed ?? false,
              onChanged: (value) => setState(
                () => widget.part.payed = value,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _name.dispose();
    _howMuch.dispose();
    super.dispose();
  }
}
