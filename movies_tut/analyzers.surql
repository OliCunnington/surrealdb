DEFINE ANALYZER movie_fts 
  TOKENIZERS class 
  FILTERS ascii, lowercase, edgengram(3,10);