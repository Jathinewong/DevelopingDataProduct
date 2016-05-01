predict_cell <- function (cell.trans, food_v, pop_v) {
        comb <- read.csv("data/comb_continent.csv", head=TRUE, fill=TRUE)
        comb$Year_num <- as.numeric(as.character(comb$Year))
        rm(dd, dd.tmp)
        ## create a commutative table for 2008 to 2020 
        
        dd <- data.frame(Year = as.character("2008"),
                          Africa_food = (comb$Africa_food[18] * (1 + food_v/100)),
                          Asia_food = (comb$Asia_food[18] * (1 + food_v/100)),
                          Australia_food = (comb$Australia_food[18] * (1 + food_v/100)),
                          Central_America_food = (comb$Central_America_food[18] * (1 + food_v/100)),
                          Europe_food = (comb$Europe_food[18] * (1 + food_v/100)),
                          North_America_food = (comb$North_America_food[18] * (1 + food_v/100)),
                          Oceania_food = (comb$Oceania_food[18] * (1 + food_v/100)),
                          South_America_food = (comb$South_America_food[18] * (1 + food_v/100)),
                          
                          Africa_pop = (comb$Africa_pop[18] * (1 + pop_v/100)),
                          Asia_pop = (comb$Asia_pop[18] * (1 + pop_v/100)),
                          Australia_pop = (comb$Australia_pop[18] * (1 + pop_v/100)),
                          Central_America_pop = (comb$Central_America_pop[18] * (1 + pop_v/100)),
                          Europe_pop = (comb$Europe_pop[18] * (1 + pop_v/100)),
                          North_America_pop = (comb$North_America_pop[18] * (1 + pop_v/100)),
                          Oceania_pop = (comb$Oceania_pop[18] * (1 + pop_v/100)),
                          South_America_pop = (comb$South_America_pop[18] * (1 + pop_v/100))
                          )
        
        for ( i in 2009 : 2020) {
                j <- i - 2008
                dd.tmp <- data.frame(Year = as.character(i),
                                      Africa_food = (dd$Africa_food[j] * (1 + food_v/100)),
                                      Asia_food = (dd$Asia_food[j] * (1 + food_v/100)),
                                      Australia_food = (dd$Australia_food[j] * (1 + food_v/100)),
                                      Central_America_food = (dd$Central_America_food[j] * (1 + food_v/100)),
                                      Europe_food = (dd$Europe_food[j] * (1 + food_v/100)),
                                      North_America_food = (dd$North_America_food[j] * (1 + food_v/100)),
                                      Oceania_food = (dd$Oceania_food[j] * (1 + food_v/100)),
                                      South_America_food = (dd$South_America_food[j] * (1 + food_v/100)),
                                      
                                      Africa_pop = (dd$Africa_pop[j] * (1 + pop_v/100)),
                                      Asia_pop = (dd$Asia_pop[j] * (1 + pop_v/100)),
                                      Australia_pop = (dd$Australia_pop[j] * (1 + pop_v/100)),
                                      Central_America_pop = (dd$Central_America_pop[j] * (1 + pop_v/100)),
                                      Europe_pop = (dd$Europe_pop[j] * (1 + pop_v/100)),
                                      North_America_pop = (dd$North_America_pop[j] * (1 + pop_v/100)),
                                      Oceania_pop = (dd$Oceania_pop[j] * (1 + pop_v/100)),
                                      South_America_pop = (dd$South_America_pop[j] * (1 + pop_v/100))
                                     )
                dd <- rbind(dd, dd.tmp)
        }
        ##dd$Year_num <- as.numeric(as.character(dd$Year))
        
        model_Africa <- glm(Africa_cell ~ Africa_food + Africa_pop, data=comb)
        predict_Africa <- predict(model_Africa, newdata = dd, type="response")
        
        model_Asia <- glm(Asia_cell ~ Asia_food + Asia_pop, data=comb)
        predict_Asia <- predict(model_Asia, newdata = dd, type="response")
        
        model_Australia <- glm(Australia_cell ~ Australia_food + Australia_pop, data=comb)
        predict_Australia <- predict(model_Australia, newdata = dd, type="response")
        
        model_Central_America <- glm(Central_America_cell ~ Central_America_food + Central_America_pop, data=comb)
        predict_Central_America <- predict(model_Central_America, newdata = dd, type="response")
        
        model_Europe <- glm(Europe_cell ~ Europe_food + Europe_pop, data=comb)
        predict_Europe <- predict(model_Europe, newdata = dd, type="response")
        
        model_North_America <- glm(North_America_cell ~ North_America_food + North_America_pop, data=comb)
        predict_North_America <- predict(model_North_America, newdata = dd, type="response")
        
        model_Oceania <- glm(Oceania_cell ~ Oceania_food + Oceania_pop, data=comb)
        predict_Oceania <- predict(model_Oceania, newdata = dd, type="response")
        
        model_South_America <- glm(South_America_cell ~ South_America_food + South_America_pop, data=comb)
        predict_South_America <- predict(model_South_America, newdata = dd, type="response")
        
        tb.tmp <- cbind(dd$Year, as.data.frame(predict_Africa), as.data.frame(predict_Asia), 
                        as.data.frame(predict_Australia), as.data.frame(predict_Central_America), 
                        as.data.frame(predict_Europe), as.data.frame(predict_North_America), 
                        as.data.frame(predict_Oceania), as.data.frame(predict_South_America) )
        colnames(tb.tmp) <- colnames(cell.trans)
        tb <- rbind(cell.trans, tb.tmp)
        return(tb)
}