part of "../../screens/home/home_screen.dart";

class _BuildEmptyTasks extends StatelessWidget {
  const _BuildEmptyTasks();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Display placeholder image for empty tasks
          Image.asset(
            AppImages.homePlaceholder,
            height: 240.h,
            width: 240.w,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
          verticalSpacing(20),
          // Display motivational text
          Text(
            "Start Your Journey",
            textAlign: TextAlign.center,
            style: TextStyles.font24Regular.copyWith(
              fontWeight: FontWeightHelper.bold,
              color: AppColors.black,
            ),
          ),
          verticalSpacing(20),
          // Display informational text with padding
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              "Every big step start with small step. Notes your first idea and "
              "start your journey!",
              textAlign: TextAlign.center,
              style: TextStyles.font14Regular.copyWith(
                color: AppColors.darkGrayColor,
              ),
            ),
          ),
          verticalSpacing(30),
          // Display arrow image
          Image.asset(
            AppImages.arrow,
            height: 100.h,
            width: 150.w,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          )
        ],
      ),
    );
  }
}
