import Distribution.PackageDescription (testType)
import GHC.Data.SizedSeq (ssElts)
-- example of a list, with its 'spine' and 'cons cells'
-- each cons cell is a ':' node.

--     :
--    / \
--  1    :
--      / \
--    2   :
--       / \
--      3   []

-- >>>  1 : 2 : 3 : []
-- [1,2,3]

-- >>> 1 : (2 : (3 : []))
-- [1,2,3]


und = undefined : (undefined : (undefined : []))

-- >>> und
-- Prelude.undefined

-- only goes over the spine, ignoring the cons cells contents:
-- >>> length und
-- 3

x = 1 + 2
-- >>> :sprint x
-- unknown command 'sprint'
