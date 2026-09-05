# BLoC Counter Lab

A Flutter mini-project demonstrating BLoC and Cubit state management with
`flutter_bloc`.

## Features

- `CounterBloc` handles increment and decrement events.
- `ThemeBloc` toggles between light and dark theme state.
- The counter screen combines `BlocListener`, `BlocBuilder`, and `BlocConsumer`.
- A negative counter opens a dialog; values `10` and `-10` show a SnackBar.

## Project Structure

- `lib/blocs/` contains the event-driven CounterBloc, ThemeBloc, and
	value-based CounterCubit.
- `lib/screens/` contains the single counter screen.
- `lib/app.dart` contains the application widget and BLoC providers.
- `lib/main.dart` contains the application entry point.
- `lib/screens/` contains the single counter screen.

## Run

```shell
flutter pub get
flutter run
```

The single counter screen contains the counter controls and the theme toggle.
