import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Class.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage1/ClassTf/index.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage2/index.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class SubjectCreatePage1Mobx = SubjectCreatePage1Base
    with _$SubjectCreatePage1Mobx;

abstract class SubjectCreatePage1Base with Store {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  final BuildContext context;
  var appmobx;

  final classkey = GlobalKey<FormState>();
  TextEditingController classController;
  @observable
  ObservableList<Class> classlist = new ObservableList<Class>();
  @observable
  ObservableList<Widget> classtf = new ObservableList<Widget>();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  String subjectcodeerrortext;
  TextEditingController subjectcodecontroller;
  String subjectnameerrortext;
  TextEditingController subjectnamecontroller;

  @action
  addClassTf(int index) {
    classtf.add(ClassTf(index));
  }

  @action
  setSubjectCode() {
    if (subjectcodecontroller.text == "" ||
        subjectcodecontroller.text == null) {
      subjectcodeerrortext = "this column should not be empty";
    } else {
      subjectcodeerrortext = null;
    }
  }

  @action
  setSubjectName() {
    if (subjectnamecontroller.text == "" ||
        subjectnamecontroller.text == null) {
      subjectnameerrortext = "this column should not be empty";
    } else {
      subjectnameerrortext = null;
    }
  }

  deleteLastClass() {
    if (classlist.length > 1) {
      classlist.removeLast();
      classtf.removeLast();
    }
  }

  SubjectCreatePage1Base(this.context) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    subjectcodecontroller = TextEditingController();
    subjectcodecontroller.addListener(() {
      setSubjectCode();
    });
    subjectnamecontroller = TextEditingController();
    subjectnamecontroller.addListener(() {
      setSubjectName();
    });
    classlist.add(Class(0));
    addClassTf(0);
  }

  nextPage() {
    String errorstring = "please:\n";
    if (subjectcodecontroller.text == "" ||
        subjectcodecontroller.text == null) {
      errorstring += "\t- enter subject code\n";
    }
    if (subjectnamecontroller.text == "" ||
        subjectnamecontroller.text == null) {
      errorstring += "\t- enter subject name\n";
    }
    var tempclasslist = [...classlist];
    if (tempclasslist.length != 1 &&
        (classlist[classlist.length - 1].classcode == null ||
            classlist[classlist.length - 1].classcode == "")) {
      tempclasslist.removeLast();
    }
    tempclasslist.forEach((element) {
      if (element.classcode == "" || element.classcode == null) {
        errorstring += "\t- class " + (element.id + 1).toString() + " name\n";
      }
    });

    String temp = "";
    List classcode = List();
    tempclasslist.map((e) => e.classcode).toList().forEach((u) {
      if (classcode.contains(u))
        temp = temp + u + ", ";
      else
        classcode.add(u);
    });
    if (temp != "") {
      temp = temp.substring(0, temp.length - 2) + " is repeated\n";
      errorstring += temp;
    }

    errorstring = errorstring.substring(0, errorstring.length - 1);

    if (errorstring != "please:") {
      final snackBar = new SnackBar(
        content: new Text(errorstring),
        behavior: SnackBarBehavior.floating,
      );
      scaffoldkey.currentState.showSnackBar(snackBar);
    } else {
      Subject subject = new Subject();
      subject.subjectcode = subjectcodecontroller.text;
      subject.subjectname = subjectnamecontroller.text;
      subject.classlist = tempclasslist;
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return SubjectCreatePage2(subject);
      }));
    }
  }

  void dispose() {
    // classController.dispose();
    subjectcodecontroller.dispose();
    subjectnamecontroller.dispose();
  }
}
