part of 'organisms.dart';

class ModalForm extends StatefulWidget {
  const ModalForm({
    required this.onPressedCancel,
    required this.onPressedCreate,
    required this.title,
    required this.accepButtontitle,
    required this.firstLabel,
    this.secondLabel,
    this.wish,
    this.image,
    super.key,
  });

  final VoidCallback onPressedCancel;
  final Function(String, String) onPressedCreate;
  final String title;
  final String firstLabel;
  final String? secondLabel;
  final String accepButtontitle;
  final String? image;
  final Wish? wish;

  @override
  State<ModalForm> createState() => _ModalFormState();
}

class _ModalFormState extends State<ModalForm> {
  late TextEditingController nameController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    if (widget.wish != null) {
      nameController = TextEditingController(text: widget.wish?.name);
    } else {
      nameController = TextEditingController();
      descriptionController = TextEditingController();
    }
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: BasePadding.paddingH24,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Spacing.spacingV24,
              const ModalBottomSheetTopBar(),
              Spacing.spacingV16,
              BaseText(
                widget.title,
                style: TypoBody.b1s,
              ),
              Spacing.spacingV24,
              BaseTextField(
                controller: nameController,
                label: widget.firstLabel,
                onChanged: (String? value) {},
              ),
              Visibility(
                visible: widget.secondLabel != null,
                child: Spacing.spacingV16,
              ),
              Visibility(
                visible: widget.secondLabel != null,
                child: BaseTextField(
                  controller: descriptionController,
                  label: widget.secondLabel,
                  onChanged: (String? value) {},
                ),
              ),
              Spacing.spacingV12,
              DecisionButton(
                isColorReversed: true,
                primaryText: L10n.of(context).sWishListCancel,
                primaryOnPressed: widget.onPressedCancel,
                secondaryText: widget.accepButtontitle,
                secondaryOnPressed: () {
                  widget.onPressedCreate(
                    nameController.text,
                    descriptionController.text,
                  );
                },
              ),
            ],
          ),
        ),
      );
}
