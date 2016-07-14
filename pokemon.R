#----Pokemon Analysis------

library(httr)
library(jsonlite)


# Raw Data
a <- fromJSON("http://pokeapi.co/api/v1/pokemon/1/")

df <- c(a$name, a$national_id, a$pkdx_id, a$attack,  a$defense,  
           a$exp, a$happiness, a$height, a$weight,
           a$hp, a$sp_atk, a$sp_def,
        ifelse(length(a$types$name)>1, 
               paste(a$types$name[1],a$types$name[2], sep=", "),
               a$types$name))

names <- c("name", "national_id", "pokedex_id", "attack", "defense",
            "exp",  "happiness", "height", "weight", "hp", "sp_atk", "sp_def", "type")


for(i in c(2:151)){
    api <- paste("http://pokeapi.co/api/v1/pokemon/",i,"/",sep="")
    a <- fromJSON(api)
    b <- c(a$name, a$national_id, a$pkdx_id, a$attack,  a$defense,  
           a$exp, a$happiness, a$height, a$weight,
           a$hp, a$sp_atk, a$sp_def,
           ifelse(length(a$types$name)>1, 
                  paste(a$types$name[1],a$types$name[2], sep=", "),
                  a$types$name)
           )
    df <- rbind(df,b)
    
}

df <- data.frame(df)
names(df) <- c("name", "national_id", "pokedex_id", "attack", "defense",
                "exp",  "happiness", "height", "weight", "hp", "sp_atk", "sp_def","type")


