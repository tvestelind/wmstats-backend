{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Stats where

import GHC.Generics (Generic)
import qualified Data.Aeson as A
import qualified Data.Text as T

data Faction
  = Empire
  | TombKings
  | Chaos
  | Orcs
  | HighElf
  | Dwarfs
  | Skaven
  | Lizardmen
  | Bretonnia
  | Kislev
  | DarkElf
  | Daemons
  | Araby
  | VampireCounts
  | DogsOfWar
  | Ogres
  | Albion
  | Goblin
  | WitchHunter
  | ChaosDwarf
  | WoodElf
  | Beastmen
  | Norse
  | NipponExp
  | CathayExp
  deriving (Generic)

instance A.ToJSON Faction where
  toJSON = A.String . factionToText

factionToText :: Faction -> T.Text
factionToText faction = case faction of
  Empire         -> "Empire"
  TombKings      -> "Tomb Kings"
  Chaos          -> "Chaos"
  Orcs           -> "Orcs"
  HighElf        -> "High Elf"
  Dwarfs         -> "Dwarfs"
  Skaven         -> "Skaven"
  Lizardmen      -> "Lizardmen"
  Bretonnia      -> "Bretonnia"
  Kislev         -> "Kislev"
  DarkElf        -> "Dark Elf"
  Daemons        -> "Daemons"
  Araby          -> "Araby"
  VampireCounts  -> "Vampire Counts"
  DogsOfWar      -> "Dogs of War"
  Ogres          -> "Ogres"
  Albion         -> "Albion"
  Goblin         -> "Goblin"
  WitchHunter    -> "Witch Hunter"
  ChaosDwarf     -> "Chaos Dwarf"
  WoodElf        -> "Wood Elf"
  Beastmen       -> "Beastmen"
  Norse          -> "Norse"
  NipponExp      -> "Nippon (Exp)"
  CathayExp      -> "Cathay (Exp)"

data Stat = Stat
  { faction :: Faction
    , wins :: Int
    , losses :: Int
    , minElo :: Int
    , averageElo :: Int
    , maxElo :: Int
  } deriving (Generic)

instance A.ToJSON Stat

stats :: [Stat]
stats =
  [ Stat Empire 68 93 842 967 1060
  , Stat TombKings 75 78 874 979 1096
  , Stat Chaos 112 124 878 972 1075
  , Stat Orcs 83 117 78 972 1075
  , Stat HighElf 88 105 811 939 1061
  , Stat Dwarfs 66 92 842 941 1052
  , Stat Skaven 38 43 889 976 1072
  , Stat Lizardmen 89 62 926 1033 1190
  , Stat Bretonnia 60 73 866 961 1066
  , Stat Kislev 30 30 901 992 1081
  , Stat DarkElf 68 76 874 975 1069
  , Stat Daemons 69 63 895 996 1087
  , Stat Araby 61 43 944 1028 1123
  , Stat VampireCounts 109 94 898 1009 1154
  , Stat DogsOfWar 46 61 894 978 1061
  , Stat Ogres 45 39 918 1004 1080
  , Stat Albion 45 37 929 1008 1088
  , Stat Goblin 62 38 941 1044 1147
  , Stat WitchHunter 20 12 948 1020 1081
  , Stat ChaosDwarf 52 34 939 1033 1130
  , Stat WoodElf 69 63 892 1004 1097
  , Stat Beastmen 8 2 993 1032 1075
  , Stat Norse 34 36 903 992 1081
  , Stat NipponExp 13 9 969 1025 1075
  , Stat CathayExp 14 10 961 1023 1080
  ]
