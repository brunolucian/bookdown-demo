library(tidyverse)
library(dplyr)

tb_chess_game <- read_csv(file="https://raw.githubusercontent.com/brunolucian/cursoBasicoR/master/datasets/chess_games.csv")

glimpse(tb_chess_game)

#### Percentual de empates ####

select(
  filter(
    mutate(
      count(
        select(tb_chess_game, winner),
        winner),
      perct_winner = n / sum(n)*100),
    winner == "draw"),
  -n)

tb_chess_game %>%
  select(winner) %>%
  count(winner) %>%
  mutate(perct_winner = n / sum(n),
         perct_winner2 = perct_winner * 100,
         perct_winner3 = perct_winner - 2,
         perct_winner2 = NULL) %>%
  filter(winner == "draw") %>%
  select(-n)

#### Transmute exemplo ####
tb_game_sales <- read_csv("https://raw.githubusercontent.com/brunolucian/cursoBasicoR/master/datasets/vgsales.csv")

tb_game_sales %>%
  transmute(
          part_na_sales = NA_Sales/Global_Sales,
          part_eu_sales = EU_Sales/Global_Sales,
          part_jp_sales = JP_Sales/Global_Sales,
          part_os_sales = Other_Sales/Global_Sales
)


#### Funcao moda ####

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}


#### Summarise tb_games_sales ####

tb_game_sales %>%
  summarise(
          media_venda_na = mean(NA_Sales, na.rm = TRUE),
          max_venda_na = max(NA_Sales, na.rm = TRUE),
          min_venda_na = min(NA_Sales, na.rm = TRUE),
          median_venda_na = median(NA_Sales, na.rm = TRUE),
          moda_venda_na = getmode(NA_Sales)

          )

tb_game_sales %>%
  filter(NA_Sales == 0) %>%
  count()


#### Arrange tb_chess_game ####

tb_chess_game %>%
  select(white_id, white_rating) %>%
  distinct() %>%
  arrange(desc(white_rating)) %>%
  top_n(15)


tb_chess_game_top_dup <- tb_chess_game %>%
     arrange(desc(white_rating)) %>%
     top_n(10) %>%
     select(white_id, white_rating)


#### top n de jogadores peças brancas por rating maximo ####

tb_chess_game %>%
  select(white_id, white_rating) %>%
  group_by(white_id) %>%
  summarise(white_rating_max = max(white_rating, na.rm = T)) %>%
  arrange(desc(white_rating_max)) %>%
  top_n(10)


n_distinct(tb_chess_game$white_id)


#### select com variaveis auxiliares ####

tb_chess_game %>%
  select(starts_with("black"))


tb_chess_game %>%
  select(contains("a"))

tb_chess_game %>%
  select(ends_with("id"))


#### Case when ####

tb_game_sales %>%
  mutate(nivel_na =
            case_when(
              NA_Sales > mean(NA_Sales) ~ "alto",
              NA_Sales < mean(NA_Sales) ~ "baixo",
              TRUE ~ "razoável"
            ))


airquality %>% tibble() %>% write_csv("airquality.csv")


#### Explicando pipe ####

# select(.data = tb_chess_game, winner)
#
# tb_chess_game %>%
#   select(winner)



