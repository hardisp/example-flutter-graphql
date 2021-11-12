import 'package:flutter/material.dart';

class WidgetUser extends StatelessWidget {
  const WidgetUser(
      {Key? key,
      this.avatarUrl,
      this.name,
      this.isLoading = false,
      this.refetch})
      : super(key: key);

  final String? avatarUrl;
  final String? name;
  final bool isLoading;
  final dynamic refetch;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: ClipRRect(
            child: Image.network(
              avatarUrl ?? '',
              width: 200,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(200)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 16,
          ),
        ),
        Text(
          name ?? 'N/A',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 16,
          ),
        ),
        ElevatedButton(
          onPressed: refetch,
          child: const Text('REFETCH'),
        ),
      ],
    );
  }
}
