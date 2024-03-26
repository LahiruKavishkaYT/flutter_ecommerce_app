# Ecommerce Application

Developed a fully-functional e-commerce application leveraging Flutter for frontend development, Dart for programming logic, and Firebase for backend services. Contributed significantly to UI/UX design, including Configuration, Login, and eCommerce User Interface components. Implemented authentication and data management functionalities using Firebase services.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# UI Design
![Mobile App UI](https://github.com/LahiruKavishkaYT/flutter_ecommerce_app/assets/134825764/d7b1437c-1d39-4884-a436-ab3ea10a5923)




# Design Errors

## Error #1: If [Size.isFinite': is not true.in Stack] Error

### Description
If you encounter the error "If [Size.isFinite': is not true.in Stack]" while using the `TPrimaryHeaderContainer` widget, it may be due to the improper sizing in the `Stack`. This error usually occurs when the size of the child widgets in the `Stack` is not finite.

### How to Fix
To resolve this error, ensure that the child widgets within the `Stack` have a finite size. In the code, check the values passed to the `SizedBox` and the positions of the `Positioned` widgets. Adjust the dimensions and positions as needed.

### Example Code
```dart
class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.only(bottom: 0),

        /// If [Size.isFinite': is not true.in Stack] error occurred -> Read README.md file at
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: TCircularContainer(
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: TCircularContainer(
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


