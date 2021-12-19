import 'package:flutter/material.dart';
import 'package:india_today_assignment/providers/astrolger_provider.dart';
import 'package:provider/provider.dart';

class AstrologersScreen extends StatelessWidget {
  const AstrologersScreen({Key? key}) : super(key: key);

  Widget iconWidget(String name, double size, double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: Image.asset(
          'assets/icons/$name.png',
          height: size,
          width: size,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final _astroProv = Provider.of<AstrologerProv>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: iconWidget('hamburger', 55, 0),
        title: iconWidget('logo', 60, 0),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: iconWidget('profile', 30, 0),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Talk to an Astrologer',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          _astroProv.toggleShowSearchBar();
                        },
                        child: iconWidget('search', 25, 8)),
                    InkWell(onTap: () {}, child: iconWidget('filter', 25, 8)),
                    InkWell(onTap: () {}, child: iconWidget('sort', 25, 8)),
                  ],
                )
              ],
            ),
            if (_astroProv.showSearchBar) const AstrologerSearchField(),
            const SizedBox(
              height: 10,
            ),
            const AstrologerList()
          ],
        ),
      ),
    );
  }
}

class AstrologerSearchField extends StatefulWidget {
  const AstrologerSearchField({Key? key}) : super(key: key);

  @override
  State<AstrologerSearchField> createState() => _AstrologerSearchFieldState();
}

class _AstrologerSearchFieldState extends State<AstrologerSearchField> {
  final TextEditingController _astroSeacrhCtrl = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _astroSeacrhCtrl.dispose();
  }

  final _formStateKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formStateKey,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.keyboard),
                  hintText: 'Search Astrolger, name, skills, experience etc.',
                ),
                onChanged: (input) {
                  Provider.of<AstrologerProv>(context, listen: false)
                      .showAstrolgersBySearch(input);
                  // print(input);
                })));
  }
}

class AstrologerList extends StatelessWidget {
  const AstrologerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _astroProv = Provider.of<AstrologerProv>(context, listen: false);
    return Expanded(
      child: ListView.builder(
        // shrinkWrap: true,
        // itemCount: _astroProv.searchAstrolgerList.length,
        itemCount: 8,
        itemBuilder: (context, index) => const AstroListItem(
            // atsro: _astroProv.searchAstrolgerList[index],
            ),
      ),
    );
  }
}

class AstroListItem extends StatelessWidget {
  // final AstrologerModel atsro;
  const AstroListItem({
    Key? key,
  }) : super(key: key);
  final List<String> nameList = const [
    'Sharib',
    'Sharib',
    'Sharib',
    'Sharib',
    'Sharib',
    'Sharib',
    'Sharib',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://tak-astrotak-av.s3.ap-south-1.amazonaws.com/astro-images/agents/880X918-my-pix.jpg',
                height: 90,
                width: 90,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dr. Preeti Bhatia',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  AstrologerDetailItem(
                    icon: Icons.work_outline,
                    text: nameList.join(', '),
                  ),
                  AstrologerDetailItem(
                    icon: Icons.translate,
                    text: nameList.join(', '),
                  ),
                  AstrologerDetailItem(
                    icon: Icons.price_change_outlined,
                    text: nameList.join(', '),
                    isBold: true,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.call_outlined,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Talk on Call',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
            const Text('25 Years')
          ],
        ),
        Divider(
          color: Colors.grey[300],
          thickness: 1,
        )
      ],
    );
  }
}

class AstrologerDetailItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isBold;
  const AstrologerDetailItem(
      {Key? key, required this.icon, required this.text, this.isBold = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Icon(
              icon,
              color: Colors.orange,
              size: 15,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Text(
            text,
            style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ))
        ],
      ),
    );
  }
}
