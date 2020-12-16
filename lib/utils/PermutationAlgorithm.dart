class PermutationAlgorithm {
  final List<List<List<String>>> elements;
  String secondlistname;

  PermutationAlgorithm(this.elements, this.secondlistname);

  List<List<String>> permutations() {
    List<List<String>> perms = [];
    generatePermutations(elements, perms, 0, []);
    return perms;
  }

  void generatePermutations(List<List<List<String>>> lists,
      List<List<String>> result, int depth, List<String> current) {
    if (depth == lists.length) {
      if (secondlistname != null) {
        current.insert(elements[0][0].length, null);
      }
      result.add(current);
      return;
    }

    for (int i = 0; i < lists[depth].length; i++) {
      generatePermutations(
          lists, result, depth + 1, [...current, ...lists[depth][i]]);
    }
  }
}
