module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)

data Documented (s :: Symbol) i o = Documented (i -> o)
class Help (s :: Symbol) p i o | p -> s i o where
  documented :: (i -> o) -> p i o
instance helpDocumented :: Help s (Documented s) i o where
  documented = Documented
instance helpFn :: Help s (->) i o where
  documented = id
type Doc (s :: Symbol) i o = forall p. Help s p i o => p i o

describe :: forall s i o a. Fail s => Documented s i o -> i -> o
describe x = (\_ -> describe x) 0

type DocArr l r = l r
infixl 4 type DocArr as :->

-- example of a documented function
showing :: forall s. Show s => Doc
  """
  `showing` is documented version of show

  An example usage is:
    
    > showing 42
    = "42"
  
    > describe showing 42
    should print this documentation
  
  """
  s :-> String
showing = documented show

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = log (showing 42)
-- main = log (describe showing 42)
