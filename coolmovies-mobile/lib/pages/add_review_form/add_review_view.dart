import 'package:coolmovies/api/graphql_mutations.dart';
import 'package:coolmovies/model/createUser_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AddReviewView extends StatefulWidget {
  const AddReviewView({Key? key}) : super(key: key);

  @override
  State<AddReviewView> createState() => _AddReviewViewState();
}

class _AddReviewViewState extends State<AddReviewView> {
  String? _name;
  String? _rating;
  String? _title;
  String? _body;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? id = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Color(0xff1d2226),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(children: [
            Text('Add your review', style: TextStyle(color: Colors.white)),
            Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          _name = value;
                        }),
                    TextFormField(
                        decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            labelText:
                                'Rating - Enter your rating from 1 to 5'),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }

                          if (int.parse(value) > 5 || int.parse(value) < 1) {
                            return 'Please enter a rating from 1 to 5';
                          }

                          return null;
                        },
                        onSaved: (String? value) {
                          _rating = value;
                        }),
                    TextFormField(
                        decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            labelText: 'Title'),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          _title = value;
                        }),
                    TextFormField(
                        decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            labelText: 'Review'),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          _body = value;
                        }),
                    Mutation(
                        options: MutationOptions(
                            document: createUser,
                            variables: {'name': _name},
                            onCompleted: (resultData) async {
                              final parsedResponse =
                                  CreateUserModel.fromJson(resultData);
                              _userId = parsedResponse.createUser.user.id;

                              var client = GraphQLProvider.of(context).value;

                              final a = await client.mutate(MutationOptions(
                                document: createMovieReview,
                                variables: {
                                  'body': _body,
                                  'movieId': id,
                                  'rating': int.parse(_rating!),
                                  'title': _title,
                                  'userReviewerId':
                                      parsedResponse.createUser.user.id
                                },
                              ));

                              print(a.exception);
                            }),
                        builder:
                            (RunMutation runMutation, QueryResult? result) {
                          return ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                runMutation({'name': _name});

                                Navigator.pop(context);
                              }
                              ;
                            },
                            child: const Text('Submit'),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
