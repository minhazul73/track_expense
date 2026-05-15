import 'src/core/imports/core_imports.dart';
import 'src/core/imports/packages_imports.dart';
import 'src/app.dart';


Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: '.env');
  
  await AppConfig.init();
  await HiveService.instance.init();
  await LiquidGlassWidgets.initialize();

  runApp(
    const LocalizationWrapper(
      child: StateWrapper(
        child: App(),
      ),
    ),
  );
}