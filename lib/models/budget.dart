class CategoryBudget {
  String category;
  double amount;

  CategoryBudget({required this.category, required this.amount});
}

class Budget {
  double monthlyBudget;
  List<CategoryBudget> categoryBudgets;

  Budget({required this.monthlyBudget, required this.categoryBudgets});
}
