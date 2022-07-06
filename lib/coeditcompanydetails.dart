import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:placement/applyapi.dart';
import 'package:placement/coeditcompanydetails.dart';
import 'package:placement/cohome.dart';
import 'package:placement/colistcompany.dart';
import 'package:placement/studapply.dart';
import 'package:placement/hiringapi.dart';
import 'package:placement/main.dart';
import 'package:placement/sql.dart';
import 'package:placement/studentapi.dart';
import 'package:placement/studentprofileapi.dart';

import 'package:placement/studhome.dart';

import 'companyapi.dart';
var cid;
