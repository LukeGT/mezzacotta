include "globals.mzn";

% Constants

int: nTiles;

set of int: Tiles = 1..nTiles;
set of int: Words = 1..nTiles;
set of int: Nums = 1..6;

array[Words] of string: Strings;
% The relevant words for each tile
array[Tiles] of set of Words: WordsOfTile;
% The relevant nums for each tile
array[Tiles] of Nums: NumOfTile;


% Variables

% The assignments of tiles to words
array[Tiles] of var Words: word_of_tile;
% For convenience, represent the inverse also
array[Words] of var Tiles: tile_of_word;
% Give the number for each word
array[Words] of var Nums: num_of_word;


% Constraints

constraint forall(t in Tiles) (
  word_of_tile[t] in WordsOfTile[t]
);

constraint inverse(word_of_tile, tile_of_word);

constraint forall(w in Words) (
  num_of_word[w] == NumOfTile[tile_of_word[w]]
);

solve satisfy;

output
  [ "tile_of_word = \(tile_of_word)\n" ] ++
  [ show(Strings[w]) ++ ", " | w in [word_of_tile[t] | t in 1..5] ] ++ ["\n"] ++
  [ show(Strings[w]) ++ ", " | w in [word_of_tile[t] | t in 6..10] ] ++ ["\n"] ++
  [ show(Strings[w]) ++ ", " | w in [word_of_tile[t] | t in 11..15] ] ++ ["\n"] ++
  [ show(Strings[w]) ++ ", " | w in [word_of_tile[t] | t in 16..20] ] ++ ["\n"] ++
  [ show(Strings[w]) ++ ", " | w in [word_of_tile[t] | t in 21..25] ] ++ ["\n"] ++
  [ show(Strings[w]) ++ ", " | w in [word_of_tile[t] | t in 26..30] ] ++
  [ "\nnum_of_word = \(num_of_word)\n" ]
;
