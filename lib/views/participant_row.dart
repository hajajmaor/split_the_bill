import 'package:flutter/material.dart';
import 'package:split_the_bill/models/participant.dart';

class ParticipantRow extends StatefulWidget {
  const ParticipantRow({Key? key, required this.part}) : super(key: key);
  final Participant part;
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
      child: Form(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                    decoration: const InputDecoration(
                      hintText: '23.5\$',
                    ),
                    keyboardType: TextInputType.number,
                    controller: _howMuch,
                    onChanged: (value) => setState(() {}),
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
