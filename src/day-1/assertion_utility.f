      subroutine assert(assertion, description)
C       internal subroutine to error terminate if assertion is false
        logical assertion
        character(len=*) description
        print *, transfer(assertion, description)
      end subroutine
