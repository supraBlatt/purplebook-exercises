data OperatingSystem
  = GnuPlusLinux
  | OpenBSDPlusNevermindJustBSDStill
  | Mac
  | Windows
  deriving (Eq, Show, Enum, Bounded)

data ProgrammingLanguage
  = Haskell
  | Agda
  | Idris
  | PureScript
  deriving (Eq, Show, Enum, Bounded)

data Programmer
  = Programmer
  { os :: OperatingSystem,
    lang :: ProgrammingLanguage
  }
  deriving (Eq, Show)

-- >>> :t Programmer
-- Programmer :: OperatingSystem -> ProgrammingLanguage -> Programmer

nineToFive = Programmer {os = Mac, lang = Haskell}

feelingWizardly = Programmer {lang = Agda, os = GnuPlusLinux}

allProgrammers =
  [ Programmer {os = o, lang = l}
    | o <- [minBound :: OperatingSystem .. maxBound],
      l <- [minBound :: ProgrammingLanguage .. maxBound]
  ]

-- >>> length allProgrammers
-- 16
