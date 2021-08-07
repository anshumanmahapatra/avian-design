import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerHelper {
  drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: const Text("Avian Design"),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About Us"),
            onTap: () {},
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("Services Offered"),
            onTap: () {},
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("Contact Us"),
            onTap: () {},
          ),
          const Divider(
            color: Colors.grey,
          ),
          const ListTile(
            title: Text(
              "Privacy Policy",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          const ListTile(
            title: Text(
              "Terms of Use",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
