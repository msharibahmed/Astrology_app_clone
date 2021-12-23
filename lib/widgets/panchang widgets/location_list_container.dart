
import 'package:flutter/material.dart';
import 'package:india_today_assignment/providers/panchang_provider.dart';
import 'package:provider/provider.dart';

class LocationListContainer extends StatelessWidget {
  const LocationListContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 225,
      left: 85,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        width: 145,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Consumer<PanchangProv>(
            builder: (context, data, _) => ListView.builder(
                shrinkWrap: true,
                itemCount: data.locationList.length,
                itemBuilder: (context, index) => InkWell(
                      onTap: () async {
                        if (data.textFieldContext != null) {
                          data.removeLocationTextFieldFocus();
                        }
                        data.changeLocation(data.locationList[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(data.locationList[index].placeName),
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}