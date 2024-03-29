import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:workcheck/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:workcheck/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:workcheck/ui/views/home/home_view.dart';
import 'package:workcheck/ui/views/startup/startup_view.dart';
import 'package:workcheck/services/shell_service.dart';
import 'package:workcheck/services/replicate_service.dart';
import 'package:workcheck/services/prediction_service.dart';
import 'package:workcheck/services/open_ai_service.dart';
import 'package:workcheck/services/device_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ShellService),
    LazySingleton(classType: ReplicateService),
    LazySingleton(classType: PredictionService),
    LazySingleton(classType: OpenAiService),
    LazySingleton(classType: DeviceService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
