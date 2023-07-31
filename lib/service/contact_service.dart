import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_contacts/model/contact_model.dart';

class ContactService {
  // final String baseUrl;
  // ContactService(this.baseUrl);

  Future<List<ContactModel>> getContact() async {
    final response = await http.get(
      Uri.parse('https://capekngoding.com/6288225409824/api/users'),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> data = jsonData['data'];
      return data.map((user) => ContactModel.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load get contact');
    }
  }

  Future<ContactModel> createContact(ContactModel contact) async {
    final response = await http.post(
      Uri.parse('https://capekngoding.com/6288225409824/api/users'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(contact.toJson()),
    );

    if (response.statusCode == 200) {
      return ContactModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed to create contact");
    }
  }

  Future<ContactModel> updateContact(ContactModel contact) async {
    final response = await http.post(
      Uri.parse(
          'https://capekngoding.com/6288225409824/api/users/${contact.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(contact.toJson()),
    );
    if (response.statusCode == 200) {
      print('success');
      return ContactModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to update contact');
    }
  }

  Future<void> deletContact(int id) async {
    final response = await http.delete(
        Uri.parse('https://capekngoding.com/6288225409824/api/users/${id}'));

    if (response.statusCode == 200) {
      print(id);
      print('delete successful');
    }
  }
}
