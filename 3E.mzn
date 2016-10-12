include "globals.mzn";


% Constants

int: nCoins;

set of int: Coins = 1..nCoins;

array[Coins] of int: CoinWeights;


% Variables

array[1..16] of var set of Coins: arrangement;


% Constraints

constraint forall(a in 1..16) (
  card(arrangement[a]) = 4
);

constraint all_disjoint(arrangement);

constraint increasing([ arrangement[a*2] | a in 1..8 ]);

array[1..16] of var int: sums = [
  sum([ CoinWeights[c] | c in arrangement[a] ])
| a in 1..16 ];

constraint forall(a in 1..8) (
  increasing([ arrangement[a*2-1], arrangement[a*2] ])
  /\ sums[a*2-1] = sums[a*2]
);


solve satisfy;

output [ show(arrangement) ++ "\n" ];
