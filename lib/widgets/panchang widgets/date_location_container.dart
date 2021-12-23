import 'package:flutter/material.dart';
import 'package:india_today_assignment/providers/panchang_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PanchangDateAndLocationConatiner extends StatelessWidget {
  const PanchangDateAndLocationConatiner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 170,
        width: double.infinity,
        color: Colors.orange[50],
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [
              PanchangDateWidget(),
              SizedBox(
                height: 25,
              ),
              PanchangLocationWidget()
            ],
          ),
        ));
  }
}

class PanchangLocationWidget extends StatefulWidget {
  const PanchangLocationWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PanchangLocationWidget> createState() => _PanchangLocationWidgetState();
}

class _PanchangLocationWidgetState extends State<PanchangLocationWidget> {
  @override
  void dispose() {
    super.dispose();
    // Provider.of<PanchangProv>(context, listen: false).disposeCtrl();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Location:'),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
          ),
          child: Consumer<PanchangProv>(builder: (context, data, _) {
            data.saveContext(context);
            return TextFormField(
              controller: data.ctrl,
              onChanged: (input) async {
                if (input.trim() != '') {
                  await data.fetchLocation(input);
                }
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                border: InputBorder.none,
                hintText: data.choosenLocation,
              ),
            );
          }),
        ))
      ],
    );
  }
}

class PanchangDateWidget extends StatefulWidget {
  const PanchangDateWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PanchangDateWidget> createState() => _PanchangDateWidgetState();
}

class _PanchangDateWidgetState extends State<PanchangDateWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('    Date:'),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
          ),
          child: Consumer<PanchangProv>(builder: (context, data, _) {
            DateTime _selectedDateTime = DateTime(
                data.panchangDateLocationModel.year,
                data.panchangDateLocationModel.month,
                data.panchangDateLocationModel.day);
            return TextField(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDateTime,
                    firstDate: DateTime(2001, 8),
                    lastDate: DateTime(2022));
                if (picked != null && picked != _selectedDateTime) {
                  await data.changeDate(picked.day, picked.month, picked.year);
                }
              },
              readOnly: true,
              // enabled: false,

              textAlign: TextAlign.start,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                suffixIcon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
                hintText: DateFormat('yMMMMd').format(_selectedDateTime),
                border: InputBorder.none,
              ),
            );
          }),
        ))
      ],
    );
  }
}
