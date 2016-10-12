include "globals.mzn";


% Constants

int: nCoins;

set of int: Coins = 1..nCoins;

array[Coins] of int: CoinWeights;


% Variables

array[1..4] of var int: left;
array[1..4] of var int: right;


% Constraints

constraint increasing(left);
constraint increasing(right);

constraint all_different(left ++ right);

constraint lex_greater(left, right);

array[1..4] of var int: left_weights = [ CoinWeights[left[c]] | c in 1..4 ];
array[1..4] of var int: right_weights = [ CoinWeights[right[c]] | c in 1..4 ];

constraint sum(left_weights) = sum(right_weights);


solve satisfy;

output [ show(left_weights) ++ "\n" ++ show(right_weights) ++ "\n" ];
