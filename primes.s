%%HP: T(0)A(D)F(.);
@ The Seive of Eratothenes
@ Author: Christopher Morgan
@ Date 01-28-2025
´
  DUP ç n                           @ an integer n
  ´
    CASE
        n 0 ==                      @ n == 0
      THEN
        {}
        KILL
      END
        n 1 ==                      @ n == 1
      THEN
        {}
        KILL
      END
        n 2 ==                      @ n == 2
      THEN
        { 2 }
        KILL
      END
        n 3 ==                      @ n == 3
      THEN
        { 2 3 }
        KILL
      END
  END
  { 0 }
  ´ 1 ª                           @ push a 0 on the begining of list a to represent 1
  z 2 1 - n 1 - 1 SEQ +
  a ç ´                           @ let a be a list of true bools in the amount of 2 through n
    2 n É FOR i                   @ for i = 2, 3, 4, ..., not exceeding É n do
    IF a i GET 1 ==             @ if A[i] is true
    THEN
                               @ for j = i^2, i^2 + i, i^2 + 2i, i^2 + 3i, ..., not exeding n do
      0 0 ç b c ´
      i SQ b i * + 'c' STO
      DO
        IF a c GET 1 ==
        THEN
                            @ set A[j] := false
          a c 0 PUT 'a' STO   @ update the list of prime bools
        END
        1 b + 'b' STO
        i SQ b i * + 'c' STO
      UNTIL
        n c <
      END
    ª
    END
    NEXT
                                  @ return all i such that A[i] is true
      2 {} ç d e
      ´
        ´
          IF 1 ==
          THEN
            e d + 'e' STO
          END
          d 1 + 'd' STO
        ª ç y ´
          a y STREAM
        ª
        e
      ª
    ª
  ª
ª
