from itertools import combinations
from collections import defaultdict

for c in combinations('mmosehssct', 8):
  d = defaultdict(int)
  regex = ''
  for letter in c:
    d[letter] += 1
  for letter in d:
    regex += '(?='
    for a in range(0, d[letter]):
      regex += '.*' + letter
    regex += ')'
  regex = '^' + regex + '.{10}$'
  print regex