library;

import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../typing/entities/campaign/commune.dart';
import '../../../../../typing/extensions/extensions.dart';
import '../../../../../typing/result/result.dart';
import '../../../../../ui/ions/ions.dart';
import '../../../../../ui/routes/routes.dart';
import '../../../../../ui/utils/utils.dart';
import '../../../../../ui/widgets/atoms/atoms.dart';
import '../../../../../ui/widgets/organisms/organisms.dart';
import '../../../domain/dependencies/dependencies.dart';

part 'state.dart';
part 'view_model.dart';
part 'screen.dart';
part 'territory_screen.g.dart';
