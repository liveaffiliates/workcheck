import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:workcheck/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:workcheck/services/shell_service.dart';
import 'package:workcheck/services/replicate_service.dart';
import 'package:workcheck/services/prediction_service.dart';
import 'package:workcheck/services/open_ai_service.dart';
import 'package:workcheck/services/device_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ShellService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ReplicateService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<PredictionService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<OpenAiService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DeviceService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterShellService();
  getAndRegisterReplicateService();
  getAndRegisterPredictionService();
  getAndRegisterOpenAiService();
  getAndRegisterDeviceService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockShellService getAndRegisterShellService() {
  _removeRegistrationIfExists<ShellService>();
  final service = MockShellService();
  locator.registerSingleton<ShellService>(service);
  return service;
}

MockReplicateService getAndRegisterReplicateService() {
  _removeRegistrationIfExists<ReplicateService>();
  final service = MockReplicateService();
  locator.registerSingleton<ReplicateService>(service);
  return service;
}

MockPredictionService getAndRegisterPredictionService() {
  _removeRegistrationIfExists<PredictionService>();
  final service = MockPredictionService();
  locator.registerSingleton<PredictionService>(service);
  return service;
}

MockOpenAiService getAndRegisterOpenAiService() {
  _removeRegistrationIfExists<OpenAiService>();
  final service = MockOpenAiService();
  locator.registerSingleton<OpenAiService>(service);
  return service;
}

MockDeviceService getAndRegisterDeviceService() {
  _removeRegistrationIfExists<DeviceService>();
  final service = MockDeviceService();
  locator.registerSingleton<DeviceService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
