module FoldN

import Data.Vect

%default total

FoldlN : Vect n Type -> Type -> Type
FoldlN xs b = TypeFold ((fs xs b) ++ [b] ++ [(TypeFold xs Type)]) b where
  fs : Vect n Type -> Type -> Vect n Type
  fs {n} xs b = (map f xs) where
    f : Type -> Type
    f a = (a -> b -> b)
  TypeFold : Vect n Type -> Type -> Type
  TypeFold Nil b = b
  TypeFold (x :: xs) b = x -> (TypeFold xs b)
