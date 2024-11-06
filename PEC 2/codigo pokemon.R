# url kaggle: https://www.kaggle.com/datasets/abcsds/pokemongo
#install.packages("dendextend")
#install.packages("circlize")
#library(dendextend)
#library(circlize)
#library(dplyr)

pokemon <- select(pokemonGO, -"Pokemon No.")

d <- dist(pokemon)
hc <- as.dendrogram(hclust(d))

labels <- pokemon$Name
names(labels) <- rownames(pokemon)
hc <- dendextend::set(hc, "labels", labels)

hc <- color_branches(hc, k = 8)
 
circlize_dendrogram(hc,
                    labels_track_height = 0.1,
                    dend_track_height = 0.5,
                    labels_cex = 0.8,
                    labels_rot = 90,
                    labels_gap = 0.01,
                    labels_col = "blue")


typepokemon <- select(pokemon, -"Name")
typepokemon <- select(typepokemon, -"Type 2")
typepokemon <- select(typepokemon, -"Image URL")
typepokemon$`Max CP` <- as.numeric(typepokemon$`Max CP`)
typepokemon$`Max HP` <- as.numeric(typepokemon$`Max HP`)

result <- typepokemon %>%
  group_by(`Type 1`) %>%
  summarise(mean_CP = mean(`Max CP`, na.rm = TRUE),
            mean_HP = mean(`Max HP`, na.rm = TRUE))

d <- dist(result)
hc <- as.dendrogram(hclust(d))

labels <- result$`Type 1`
names(labels) <- rownames(result)
hc <- dendextend::set(hc, "labels", labels)

hc <- color_branches(hc, k = 8)

circlize_dendrogram(hc,
                    labels_track_height = NA,
                    dend_track_height = 0.5)
                    
                    
circlize_dendrogram(hc,
                    labels_track_height = 0.1,
                    dend_track_height = 0.5,
                    labels_cex = 0.8,
                    labels_rot = 90,
                    labels_gap = 0.01,
                    labels_col = "blue")
