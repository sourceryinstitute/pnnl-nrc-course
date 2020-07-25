      subroutine assert(assertion, description)
C       external subroutine lacking compile-time checking of
C       argument type, type parameter, and rank.
        logical assertion
        character(len=*) description
        print *, transfer(assertion, description)
      end subroutine
