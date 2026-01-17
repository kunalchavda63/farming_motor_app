enum RoutesEnum {
  login('/login'),
  signup('/signup'),
  forgot('/forgot-password'),
  otp('/otp'),
  reset('/reset'),
  splash('/'),
  onboarding('/onboarding'),
  screen('/screen');
  const RoutesEnum(this.path);

  final String path;

}
