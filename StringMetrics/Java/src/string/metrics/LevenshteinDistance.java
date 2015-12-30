package string.metrics;

public class LevenshteinDistance {

	public int calculateRecursively(String string1, String string2) {

		if (string1.equals(string2)) {
			return 0;
		}

		int length1 = string1.length();
		int length2 = string2.length();

		if (length1 == 0) {
			return length2;
		}

		if (length2 == 0) {
			return length1;
		}

		int cost = (string1.charAt(length1 - 1) == string2.charAt(length2 - 1)) ? 0 : 1;

		int deleteCharFromString1Distance = this.calculateRecursively(string1.substring(0, length1 - 1), string2) + 1;
		int deleteCharFromString2Distance = this.calculateRecursively(string1, string2.substring(0, length2 - 1)) + 1;
		int deleteCharFromBothStringsDistance = this.calculateRecursively(string1.substring(0, length1 - 1),
				string2.substring(0, length2 - 1)) + cost;

		return Math.min(Math.min(deleteCharFromString2Distance, deleteCharFromString2Distance),
				deleteCharFromBothStringsDistance);

	}

	public int calculateIteratively(String string1, String string2) {

		if (string1.equals(string2)) {
			return 0;
		}

		int length1 = string1.length();
		int length2 = string2.length();

		if (length1 == 0) {
			return length2;
		}

		if (length2 == 0) {
			return length1;
		}

		int[] v0 = new int[length2 + 1];
		int[] v1 = new int[length2 + 1];

		for (int j = 0; j <= length2; ++j) {
			v0[j] = j;
		}

		for (int i = 0; i < length1; ++i) {
			v1[0] = i + 1;

			for (int j = 0; j < length2; ++j) {
				int cost = (string1.charAt(i) == string2.charAt(j)) ? 0 : 1;
				v1[j + 1] = Math.min(Math.min(v1[j] + 1, v0[j + 1] + 1), v0[j] + cost);
			}

			for (int j = 0; j <= length2; ++j) {
				v0[j] = v1[j];
			}
		}

		return v1[length2];
	}

	public int[][] calculateFullMatrix(String string1, String string2) {

		int length1 = string1.length();
		int length2 = string2.length();

		int[][] result = new int[length1 + 1][length2 + 1];

		// Initialization of the array
		for (int i = 1; i <= length1; ++i) {

			result[i][0] = i;

			for (int j = 1; j <= length2; ++j) {
				result[i][j] = 0;
			}
		}

		for (int j = 0; j <= length2; ++j) {
			result[0][j] = j;
		}

		// Calculation
		for (int j = 0; j < length2; ++j) {
			for (int i = 0; i < length1; ++i) {
				if (string1.charAt(i) == string2.charAt(j)) {
					result[i + 1][j + 1] = result[i][j];
				} else {
					result[i + 1][j + 1] = Math.min(Math.min(result[i][j + 1] + 1, result[i + 1][j] + 1),
							result[i][j] + 1);
				}
			}
		}

		return result;

	}

}
