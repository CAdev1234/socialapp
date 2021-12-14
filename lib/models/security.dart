import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Security {
  String title;
  String value;
  Icon? icon;

  Security({required this.title, required this.value, this.icon});
}

List demoSecurity = [
  Security(
    title: 'Phone Number',
    value: '+91 8888 888 888',
    
    icon: const Icon(Icons.phone_android, size: 20)
  ),
  Security(
    title: 'Email',
    value: 'johnsmith@gmail.com',
    
    icon: const Icon(Icons.email, size: 20)
  ),
  Security(
    title: 'Profile Picture',
    value: '',
    
    icon: const Icon(Icons.image, size: 20)
  ),
  Security(
    title: 'Active Status',
    value: '',
    
    icon: const Icon(Icons.person, size: 20)
  ),
  Security(
    title: 'Groups',
    value: '',
    
    icon: const Icon(Icons.groups, size: 20)
  ),
  Security(
    title: 'Read Recipients',
    value: '',
    
    icon: const Icon(Icons.receipt, size: 20)
  ),
];