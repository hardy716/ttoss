import 'package:fast_app_base/screen/main/tab/home/banks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan1 = BankAccount(
  bankShinhan,
  30000000,
  accountTypeName: "신한 주거래 우대통장(저축예금)",
);
final bankAccountShinhan2 = BankAccount(
  bankShinhan,
  6000000,
  accountTypeName: "저축예금",
);
final bankAccountShinhan3 = BankAccount(
  bankShinhan,
  900000,
  accountTypeName: "저축예금",
);
final bankAccountKakao = BankAccount(
  bankKakao,
  50000000,
  accountTypeName: "입출금통장",
);
final bankAccountToss = BankAccount(
  bankToss,
  1000000,
);

final List<BankAccount> bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountKakao,
  bankAccountToss,
];
