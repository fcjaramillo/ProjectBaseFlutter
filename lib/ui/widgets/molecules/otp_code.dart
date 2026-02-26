part of 'molecules.dart';

class OtpCode extends StatelessWidget {
  final TextEditingController controllerOne;
  final TextEditingController controllerTwo;
  final TextEditingController controllerThree;
  final TextEditingController controllerFour;
  final TextEditingController controllerFive;
  final TextEditingController controllerSix;
  final FocusNode? focusNodeOne;
  final FocusNode? focusNodeTwo;
  final FocusNode? focusNodeThree;
  final FocusNode? focusNodeFour;
  final FocusNode? focusNodeFive;
  final FocusNode? focusNodeSix;
  final void Function(String)? focusOnChangedOne;
  final void Function(String)? focusOnChangedTwo;
  final void Function(String)? focusOnChangedThree;
  final void Function(String)? focusOnChangedFour;
  final void Function(String)? focusOnChangedFive;
  final void Function(String)? focusOnChangedSix;
  final bool isEmptyOne;
  final bool isEmptyTwo;
  final bool isEmptyThree;
  final bool isEmptyFour;
  final bool isEmptyFive;
  final bool isEmptySix;

  const OtpCode({
    required this.controllerOne,
    required this.controllerTwo,
    required this.controllerThree,
    required this.controllerFour,
    required this.controllerFive,
    required this.controllerSix,
    this.focusNodeOne,
    this.focusNodeTwo,
    this.focusNodeThree,
    this.focusNodeFour,
    this.focusNodeFive,
    this.focusNodeSix,
    this.focusOnChangedOne,
    this.focusOnChangedTwo,
    this.focusOnChangedThree,
    this.focusOnChangedFour,
    this.focusOnChangedFive,
    this.focusOnChangedSix,
    this.isEmptyOne = true,
    this.isEmptyTwo = true,
    this.isEmptyThree = true,
    this.isEmptyFour = true,
    this.isEmptyFive = true,
    this.isEmptySix = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: <Widget>[
        SizedBox(
          height: 50,
          width: 50,
          child: BaseTextField(
            textAlign: TextAlign.center,
            controller: controllerOne,
            maxLength: 1,
            focusNode: focusNodeOne,
            onChanged: focusOnChangedOne,
            keyboardType: TextInputType.number,
            textStyle: TypoSecondary.b3r,
            borderColor: isEmptyOne
                ? colorScheme.surfaceContainer
                : colorScheme.outline,
            focusedBorderColor: colorScheme.outline,
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 50,
          width: 50,
          child: BaseTextField(
            textAlign: TextAlign.center,
            controller: controllerTwo,
            maxLength: 1,
            focusNode: focusNodeTwo,
            onChanged: focusOnChangedTwo,
            keyboardType: TextInputType.number,
            textStyle: TypoSecondary.b3r,
            borderColor: isEmptyTwo
                ? colorScheme.surfaceContainer
                : colorScheme.outline,
            focusedBorderColor: colorScheme.outline,
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 50,
          width: 50,
          child: BaseTextField(
            textAlign: TextAlign.center,
            controller: controllerThree,
            maxLength: 1,
            focusNode: focusNodeThree,
            onChanged: focusOnChangedThree,
            keyboardType: TextInputType.number,
            textStyle: TypoSecondary.b3r,
            borderColor: isEmptyThree
                ? colorScheme.surfaceContainer
                : colorScheme.outline,
            focusedBorderColor: colorScheme.outline,
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 50,
          width: 50,
          child: BaseTextField(
            textAlign: TextAlign.center,
            controller: controllerFour,
            maxLength: 1,
            focusNode: focusNodeFour,
            onChanged: focusOnChangedFour,
            keyboardType: TextInputType.number,
            textStyle: TypoSecondary.b3r,
            borderColor: isEmptyFour
                ? colorScheme.surfaceContainer
                : colorScheme.outline,
            focusedBorderColor: colorScheme.outline,
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 50,
          width: 50,
          child: BaseTextField(
            textAlign: TextAlign.center,
            controller: controllerFive,
            maxLength: 1,
            focusNode: focusNodeFive,
            onChanged: focusOnChangedFive,
            keyboardType: TextInputType.number,
            textStyle: TypoSecondary.b3r,
            borderColor: isEmptyFive
                ? colorScheme.surfaceContainer
                : colorScheme.outline,
            focusedBorderColor: colorScheme.outline,
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 50,
          width: 50,
          child: BaseTextField(
            textAlign: TextAlign.center,
            controller: controllerSix,
            maxLength: 1,
            focusNode: focusNodeSix,
            onChanged: focusOnChangedSix,
            keyboardType: TextInputType.number,
            textStyle: TypoSecondary.b3r,
            borderColor: isEmptySix
                ? colorScheme.surfaceContainer
                : colorScheme.outline,
            focusedBorderColor: colorScheme.outline,
          ),
        ),
      ],
    );
  }
}
