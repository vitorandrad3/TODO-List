import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../design_system/box_spacing/box_spacer.dart';
import '../../settings/presentation/settings_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  // ignore: type_annotate_public_apis
  Future<void> openURL(Uri url) async {
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 220,
              child: CachedNetworkImage(
                imageUrl:
                    'https://yt3.googleusercontent.com/ytc/AGIKgqM8zh66fZqGKeTkopHaU9GM4zvyuFnQhXThr37u=s900-c-k-c0x00ffffff-no-rj',
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const DSBoxSpacing.xLarge(),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SettingsPage(),
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Icon(Icons.settings),
                    DSBoxSpacing(),
                    Text('Configurações'),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('confira o'),
                TextButton(
                  onPressed: () {
                    openURL(
                      Uri.parse(
                        'https://github.com/vitorandrad3/TODO-List',
                      ),
                    );
                  },
                  child: const Text('repositório'),
                ),
                const Text('deste projeto'),
              ],
            ),
            const DSBoxSpacing.large(),
          ],
        ),
      ),
    );
  }
}
