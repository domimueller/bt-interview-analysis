# ===============================================================
# results of the interviews concerning with 
#    - Prof. Dr. med. vet. Samuel Kohler (SK) and  
#    - Prof. Dr. med. vet. Gaby Hirsbrunner (GH)
#
# weighting of the presence and absence of traits during birth 
#
#===============================================================


# ----------------------------------------------------------------
# import & configuration used  for LaTeX-Tables out of DataFrame 
# ----------------------------------------------------------------

library(xtable)
options(xtable.floating = FALSE)
options(xtable.timestamp = "")


# ----------------------------------------------------------------
##### constants #####
# ----------------------------------------------------------------

## Vector with all the traits identified as signs of upcoming birth  ##

TRAITS_LABELS <- c(  "Wiederkehrende Schwanzhebung", 
                     "Wiederholtes Aufstehen und Abliegen",
                     "Häufiges hin-und-her-Treten (Trippeln)",
                     "Drehung des Kopfes zum Bauch hin",
                     "Rote Färbung der äusseren Geschlechtsorgane",
                     "Blutiger Scheidenausfluss",
                     "Klarer Scheidenausfluss",
                     "Eingefallene Beckenbänder",
                     "Euterödem",
                     "Glänzende Zitzen",
                     "Tropfende Milch",
                     "Hyperplasie des Euters",
                     "Schleimsekretion",
                     "Schamlippenödem",
                     "Seitliches Liegen",
                     "Seitliches Liegen bei Anbindehaltung (nur G.H.)",
                     "Seitliches Liegen bei Freilauf (nur G.H.)", 
                     "Seitliches Liegen mit Abdominalkontraktion",
                     "Wasser- und Schleimblase" 
                     
)

COLUMN_NAMES  <- c("Bewertung (S.K.)", "Gewichtung (S.K.)", "Bewertung (G.H.)",
                   "Gewichtung(G.H.)", "Bewertung (S.K.)", "Gewichtung (S.K.)", 
                   "Bewertung (G.H.)", "Gewichtung (G.H.)","Anwesenheit","Abwesenheit" 
                                       
) 

LATEX_TABLE_CAPTION <- "Bewertung der Anwesenheit und Abwesenheit von Merkmalen als Indikator einer bevorstehenden Geburt."


# ----------------------------------------------------------------
##### TRAITS PRESENCE AND ABSENCE WEIGHTING SECTION #####
# ----------------------------------------------------------------

# ----------------------------------------------------------------
# Weighting data
# ----------------------------------------------------------------

## weighting of the presence and absence of these traits  ##

# Data of Interview with Samuel Kohler (sk) #      
presence_weight_sk <- c( 3, 9, 7, 8, 4, 3, 3, 9, 2, 4, 6, 1, 8, 6, 8, 99, 99, 10, 99 )
absence_weight_sk <- c( -2, -2, -2, -7, -2, -2, -2, -8, -1, -2, -2, -1, -2, -8, 99, 99, 99, -7, 99  )

weight_sk_presence <- c( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0  )
weight_sk_absence <- c( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0  )

## Data of Interview with Gaby Hirsbrunner (gh) ##
presence_weight_gh <- c( 6, 6, 2, 8, 0, 1, 1, 10, 7, 8, 2, 6, 6, 7, 99, 9, 4, 10,10  )
absence_weight_gh <- c( 0, 0, 0, 0, 0, 0, 0, -7, -9, -9, 0, 0, 0, 0, 0, 99, 99,0, 0 )

weight_gh_presence <- c( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1 )
weight_gh_absence <- c( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1  )

total_weight_presence <- weight_gh_presence+weight_sk_presence
total_weight_absence <- weight_gh_presence+weight_sk_presence

weighted_presence <- (presence_weight_sk * weight_sk_presence + presence_weight_gh*weight_gh_presence)/ total_weight_presence
weighted_absence <- (absence_weight_sk * weight_sk_absence + absence_weight_gh*weight_gh_absence)/ total_weight_absence


traits_weight_df<-data.frame(
                             presence_weight_sk, weight_sk_presence,
                             presence_weight_gh, weight_gh_presence,
                             absence_weight_sk, weight_sk_absence,
                             absence_weight_gh, weight_gh_absence,
                             weighted_presence,weighted_absence, 
                             check.rows=TRUE, row.names = TRAITS_LABELS
)

# ----------------------------------------------------------------
# print the data 
# ----------------------------------------------------------------

print(traits_weight_df)



# ----------------------------------------------------------------
# prepare the data for LaTeX-Code Generation 
# ----------------------------------------------------------------

names(traits_weight_df) <- COLUMN_NAMES

# ----------------------------------------------------------------
# Generate the LaTeX-Table
# ----------------------------------------------------------------

## 1 digit "after comma" for the last who values. Otherwise integers only

xtable(traits_weight_df, 
       caption= LATEX_TABLE_CAPTION, 
       digits = c(0, 0, 0, 0, 0, 0, 0, 
0, 0, 1, 1 )
)

# ==========================================================
# END
# ==========================================================

