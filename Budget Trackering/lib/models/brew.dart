class Brew {
  final String? expense;
  final int? value;

  Brew({this.expense, this.value});
}

class Total {
  final int? total;

  Total({this.total});
  getTotal() {
    return this.total;
  }
}
