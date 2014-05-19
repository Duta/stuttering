module Stuttering.Typechecker
( TypeMap(..)
, getType
) where

import Stuttering.AST
import qualified Data.Map as M

-- Fuckin' types, how do they work?
-- http://youtu.be/_-agl0pOQfs?t=1m50s

type TypeMap = M.Map String Type

getType :: TypeMap -> Expr -> Type
getType t (Var ident)                          = t M.! ident
getType _ (IntLit _)                           = Int
getType _ (BoolLit _)                          = Bool
getType _ (StringLit _)                        = String
getType _ (UnaryOp Negate _)                   = Bool
getType _ (UnaryOp Not _)                      = Int
getType t (BinaryOp Add e1 e2)
  | getType t e1 == Int && getType t e2 == Int = Int
  | otherwise                                  = String
getType _ (BinaryOp Subtract _ _)              = Int
getType _ (BinaryOp Multiply _ _)              = Int
getType _ (BinaryOp Divide _ _)                = Int
getType _ (BinaryOp And _ _)                   = Bool
getType _ (BinaryOp Or _ _)                    = Bool
getType _ (BinaryOp Greater _ _)               = Bool
getType _ (BinaryOp Less _ _)                  = Bool
getType _ (BinaryOp Equal _ _)                 = Bool
getType _ (BinaryOp GreaterOrEqual _ _)        = Bool
getType _ (BinaryOp LessOrEqual _ _)           = Bool
