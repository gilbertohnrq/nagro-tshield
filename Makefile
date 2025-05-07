
clean:
	fvm flutter clean

run_coverage:
	fvm flutter test --coverage
	brew install lcov
	genhtml coverage/lcov.info -o coverage/html
	cd coverage/html && open index.html

pubget:
	fvm flutter pub get
	dart run dart_code_linter:metrics check-unused-code lib
	dart run dart_code_linter:metrics check-unused-files lib
	dart run dart_code_linter:metrics analyze lib
	dart run dart_code_linter:metrics check-unnecessary-nullable lib

build_android:
	fvm flutter clean
	fvm flutter build appbundle

build_ios:
	@cd ios && \
	rm -f Podfile.lock && \
	pod install && \
	cd ..
	fvm flutter clean
	fvm flutter build ios

theme_size_watch:
	dart run scripts/generate_theme_sizes.dart -w

theme_size:
	dart run scripts/generate_theme_sizes.dart
 
