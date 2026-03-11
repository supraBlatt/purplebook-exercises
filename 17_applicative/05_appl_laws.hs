{-
  Hask = <Types, I = (), * = (,)> (does Types include higher kinded ones?)
  is a monoidal category, with identity () and product (,).

  An endo-functor F over Hask maps:
  - every type [A] to a type [F(A)]
  - every morphism [f : A -> B] to a morphism [F(f) : F(A) -> F(B)]

  A monoidal endo-functor F over Hask has:
  - an arrow uAr : I -> F(I)
  - arrows compAr : F(A) * F(B) -> F(A * B)

  I don't get it.. it's like there is the functor
  that is on the 'categorial' level
  and then there are the arrows inside the category.
  These arrows serve as proofs that the functor respects the monoid somehow?

  The arrows you pick have to satisfy:
  I dont get it at all.. nvm
-}

-- 1. pure id <*> v = v 
-- 2. pure (.) <*> u <*> v <*> w = u <*> (v <*> w)
-- 3. pure f <*> pure x = pure (f x)
-- 4. u <*> pure y = pure ($ y) <*> u

-- i dont understand why 4 is necessasry.
