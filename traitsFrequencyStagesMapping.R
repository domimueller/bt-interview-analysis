# ===============================================================
# results of the interviews concerning with 
#    - Prof. Dr. med. vet. Samuel Kohler (SK) and  
#    - Prof. Dr. med. vet. Gaby Hirsbrunner (GH)
#
# Frequency of the traits and mapping of traits to birth stages
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

TRAITS_LABELS_SK                       <- c( "Wiederkehrende Schwanzhebung", 
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
                                             "Seitliches Liegen mit Abdominalkontraktion"
                                             
)

TRAITS_LABELS_GH                       <- c( "Wiederkehrende Schwanzhebung", 
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
                                             "Seitliches Liegen ohne Abdominalkontraktion",
                                             "Seitliches Liegen mit Abdominalkontraktion",
                                             "Wasserblase",
                                             "Schleimblase"
)

## Vector with the name of all the identified birth stages  ##

BIRTH_STAGES_SK                     <- c( "Vorbereitungsphase (4 Tage)",
                                         "Vorbereitungsphase (24h)",
                                         "Öffnungsphase",
                                         "Aufweitungsphase",
                                         "Austreibungsphase",
                                         "Nachgeburtsphase"
)
                                         
BIRTH_STAGES_GH                     <- c( "Vorbereitungsphase (4 Tage)",
                                            "Vorbereitungsphase (24h",
                                            "Eröffnungsphase",
                                            "Austreibungsphase",
                                            "Nachgeburtsphase"
)

FREQUENCY_COLUMN_NAME               <- "Häufigkeit"

BITH_STAGE_MARKER_POSITIVE          <- "xmark"  #This sign shows, that this trait does occur in a particular birth stage
BITH_STAGE_MARKER_NEGATIVE          <- ""  #This sign shows, that this trait does not occur in a particular birth stage

LATEX_TABLE_CAPTION_SK                 <- "Zuordnung von Merkmalen zu Geburtsphasen und Bewertung der Häufigkeiten von Merkmalen (Samuel Kohler)"
LATEX_TABLE_CAPTION_GH                 <- "Zuordnung von Merkmalen zu Geburtsphasen und Bewertung der Häufigkeiten von Merkmalen (Gaby Hirsbrunner)"

# ----------------------------------------------------------------
# frequency and birth stage data
# ----------------------------------------------------------------

## birth stage data is being modelled as binary data instad of "x" to facilitate ongoing changes and calculation   ##

traits_frequency_sk                 <- c( "häufig", "häufig", "häufig", "immer", "häufig", 
                                          "häufig", "häufig", "immer", "häufig", "häufig", 
                                          "selten-häufig", "immer", "häufig", "immer", "immer"   
)

traits_stages_sk                    <-matrix(
                                              c( 
                                                  c(1,1,0,0,0,0), c(0,1,0,0,0,0), c(0,1,0,0,0,0), c(1,1,0,0,0,0), c(0,1,1,0,0,0),
                                                  c(0,1,1,0,0,0), c(0,1,1,0,0,0), c(1,1,0,0,0,0), c(1,1,0,0,0,0), c(1,1,0,0,0,0), 
                                                  c(1,1,0,0,0,0), c(1,0,0,0,0,0), c(0,1,1,0,0,0), c(1,1,0,0,0,0), c(0,0,1,1,1,0)
                                              ),    
                                              
                                              byrow=TRUE, nrow=15 
)

traits_frequency_gh                 <- c( "häufig", "häufig", "selten", "häufig", "nicht zutreffend", 
                                          "nicht zutreffend", "immer", "immer", "selten", "häufig",
                                          "häufig", "immer", "immer", "häufig", "häufig",
                                          "immer", "immer", "immer"
)


traits_stages_gh                    <-matrix(
                                              c( 
                                                  c(0,1,1,0,0), c(0,0,1,0,0), c(1,1,0,0,0), c(0,0,0,1,0), c(0,0,0,0,0), 
                                                  c(0,0,0,0,0), c(1,0,0,0,0), c(1,1,0,0,0), c(1,1,0,0,0), c(0,1,1,0,0), 
                                                  c(0,1,1,0,0), c(1,1,0,0,0), c(1,0,0,0,0), c(1,1,0,0,0), c(0,0,0,1,0), 
                                                  c(0,0,0,1,0), c(0,0,1,0,0), c(0,0,0,1,0)
                                                ),    
                                                
                                              byrow=TRUE, nrow=18
)

## column naming according to birth stages
colnames(traits_stages_sk) <- BIRTH_STAGES_SK
colnames(traits_stages_gh) <- BIRTH_STAGES_GH


#traits_stages_mapping <-c()

str(traits_frequency_sk)
str(traits_stages_sk)
str(traits_stages_sk)


frequency_stage_map_sk_df          <- data.frame(
                                                traits_frequency_sk,traits_stages_sk, 
                                                check.rows=TRUE, row.names = TRAITS_LABELS_SK
)


frequency_stage_map_gh_df          <- data.frame(
                                                traits_frequency_gh,traits_stages_gh, 
                                                check.rows=TRUE, row.names = TRAITS_LABELS_GH
)

# ----------------------------------------------------------------
# prepare the data for LaTeX-Code Generation 
# ----------------------------------------------------------------

## Set column names
colnames(frequency_stage_map_sk_df)<- c(FREQUENCY_COLUMN_NAME, BIRTH_STAGES_SK)
colnames(frequency_stage_map_gh_df)<- c(FREQUENCY_COLUMN_NAME, BIRTH_STAGES_GH) 


## set "x" if value=1 and " " if value=0

  for ( i in seq_along(frequency_stage_map_sk_df)) {
    
      for(j in seq_along(frequency_stage_map_sk_df[,i])){
       
          if (frequency_stage_map_sk_df[j,i] == 1){
            frequency_stage_map_sk_df[j,i] <- BITH_STAGE_MARKER_POSITIVE
          }
          
          if (frequency_stage_map_sk_df[j,i] == 0){
            frequency_stage_map_sk_df[j,i] <- BITH_STAGE_MARKER_NEGATIVE
          }      
      
      }
  }  

## set "x" if value=1 and " " if value=0

for ( i in seq_along(frequency_stage_map_gh_df)) {
  
  for(j in seq_along(frequency_stage_map_gh_df[,i])){
    
    if (frequency_stage_map_gh_df[j,i] == 1){
      frequency_stage_map_gh_df[j,i] <- BITH_STAGE_MARKER_POSITIVE
    }
    
    if (frequency_stage_map_gh_df[j,i] == 0){
      frequency_stage_map_gh_df[j,i] <- BITH_STAGE_MARKER_NEGATIVE
    }      
    
  }
} 

# ----------------------------------------------------------------
# prepare the data for further analysis (factors) 
# ----------------------------------------------------------------

factor_frequency_sk        <- factor(traits_frequency_sk, order = TRUE, levels = c("nicht zutreffend",
                                                                                  "nie", 
                                                                                  "selten", 
                                                                                  "selten-häufig", 
                                                                                  "häufig", 
                                                                                  "immer"
                                                                                  )
)

factor_frequency_gh        <- factor(traits_frequency_gh, order = TRUE, levels = c("nicht zutreffend",
                                                                                   "nie", 
                                                                                   "selten", 
                                                                                   "selten-häufig", 
                                                                                   "häufig", 
                                                                                   "immer"
)
)

factor_frequency_sk
factor_frequency_gh
# ----------------------------------------------------------------
# print the data 
# ----------------------------------------------------------------
print(frequency_stage_map_sk_df)

print(frequency_stage_map_gh_df)


# ----------------------------------------------------------------
# Generate the LaTeX-Table
# ----------------------------------------------------------------

## 1 digit "after comma" for the last who values. Otherwise integers only
print("LaTeX Tabelle mit Daten von Samuel Kohler")

xtable(frequency_stage_map_sk_df, 
       caption=LATEX_TABLE_CAPTION_SK, 
)

print("LaTeX Tabelle mit Daten von Gaby Hirsbrunnder")

xtable(frequency_stage_map_gh_df, 
       caption=LATEX_TABLE_CAPTION_GH, 
)

# ==========================================================
# END
# ==========================================================

