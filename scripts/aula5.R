library(tidyverse)

tb_game_sales <- read_csv("https://raw.githubusercontent.com/brunolucian/cursoBasicoR/master/datasets/vgsales.csv")

glimpse(tb_game_sales)


#### escopo ggplot ####
# ggplot(data = <DATA>) +
#   <GEOM_FUNCTION>(
#     mapping = aes(<MAPPINGS>),
#     stat = <STAT>,
#     position = <POSITION>,
#     data = <DATA> # pode receber os dados diretamente
#   ) +
#   <SCALE_FUNCTION> + # uma para cada elemento estético
#   <COORDINATE_FUNCTION> +
#   <FACET_FUNCTION> # dividir o gráfico em subplots

ggplot(data=tb_game_sales,
       mapping = aes(x = Genre , y=NA_Sales)) +
      geom_point(aes(color=Platform))

tb_game_sales %>%
  # filter(Platform == "Wii") %>%
  filter(Platform %in% c("Wii", "X360","PS3","PS4","N64")) %>%
  ggplot(mapping = aes(x=Genre, y=NA_Sales))+
  geom_point(aes(color = Platform))


tb_game_sales %>%
  filter(Platform %in% c("PS", "PS2", "PS3", "PS4")) %>%
  ggplot(mapping = aes(x=Genre, y=NA_Sales))+
  geom_point(color = "red")

tb_game_sales %>%
  filter(Platform %in% c("PS", "PS2", "PS3", "PS4")) %>%
  ggplot(mapping = aes(x=Genre, y=NA_Sales))+
  geom_point(shape = 5)


p <- tb_game_sales %>%
  filter(Platform %in% c("PS", "PS2", "PS3", "PS4")) %>%
  ggplot(mapping = aes(x=NA_Sales))

p + geom_density()

p + geom_boxplot()

p + geom_histogram()



tb_game_sales %>%
  filter(Year %in% c(2010:2017)) %>%
  group_by(Year, Genre) %>%
  summarise(soma_na_sales = sum(NA_Sales),
            median_na_sales = median(NA_Sales, na.rm = T)) %>%
  ggplot(aes(x = Genre, y = soma_na_sales, fill = as.factor(Year))) +
  geom_bar(stat = "identity") +
  geom_point(aes(y = soma_na_sales), color = "red")


p <- tb_game_sales %>%
  filter(Platform %in% c("PS", "PS2", "PS3", "PS4")) %>%
  ggplot(mapping = aes(x=Global_Sales, y=NA_Sales))

p + geom_point()

p <- tb_game_sales %>%
  filter(Platform %in% c("PS", "PS2", "PS3", "PS4"),
         Genre %in% c("Action","Racing","Shooter",
                      "Role-Playing","Sports"  )) %>%
  ggplot(mapping = aes(x=Genre, y=NA_Sales))

p + geom_boxplot()

p + geom_violin()

p2 <- tb_game_sales %>%
  filter(Year %in% 2000:2017) %>%
  group_by(Year) %>%
  summarise(media_global = mean(Global_Sales)) %>%
  ggplot(mapping = aes(x=Year, y=media_global, group = 1))+
  geom_line()


tb_game_sales %>%
  filter(Platform %in% c("PS", "PS2", "PS3", "PS4"),
         Year %in% 2000:2017) %>%
  group_by(Year, Platform) %>%
  summarise(media_global = mean(Global_Sales)) %>%
  ggplot(mapping = aes(x=Year, y=media_global,
                       linetype = Platform,
                       group = Platform))+
  geom_line()


p_dodge <- tb_game_sales %>%
  filter(Platform %in% c("PS3", "PS4"),
         Genre %in% c("Action","Racing")) %>%
  ggplot(mapping = aes(x = Platform, y = Global_Sales,
                       fill = Genre)) +
  geom_bar(stat = "identity", position="dodge")


p_dodge + coord_flip()



tb_game_sales %>%
  filter(Platform %in% c("PS3", "PS4"),
         Genre %in% c("Action","Racing")) %>%
  ggplot(mapping = aes(x = Platform, y = Global_Sales,
                       fill = Genre)) +
  geom_bar(stat = "identity", position="fill")


mpg %>%
  ggplot(mapping=aes(x=displ, y=hwy))+
  geom_point(position="jitter")


tb_game_sales %>%
  filter(Year %in% c(2010:2017)) %>%
  group_by(Year, Genre) %>%
  summarise(soma_na_sales = sum(NA_Sales),
            median_na_sales = median(NA_Sales,
                                     na.rm = T)) %>%
  ggplot(aes(x = Genre, y = soma_na_sales)) +
  geom_bar(stat = "identity") +
  geom_point(aes(y = soma_na_sales), color = "red") +
  facet_wrap(~Year)



tb_game_sales %>%
  filter(Year > 2010) %>%
  group_by(Year, Platform) %>%
  summarise(media_global = mean(Global_Sales)) %>%
  ggplot(mapping = aes(x=Year, y=media_global, group = 1))+
  geom_line() +
  facet_grid(~ Platform)


tb_game_sales %>%
  filter(Platform %in% c("PS3", "PS4"),
         Genre %in% c("Action","Racing")) %>%
  ggplot(mapping = aes(x = Platform,
                       y = Global_Sales,
                       fill = Genre)) +
  geom_bar(stat = "identity", position="dodge") +
  labs(title="Vendas por Plataforma",
       x = "Plataforma",
       y = "Vendas",
       fill = "Genero")


tb_game_sales %>%
  filter(Platform %in% c("PS3", "PS4"),
         Genre %in% c("Action","Racing")) %>%
  ggplot(mapping = aes(x = Platform,
                       y = Global_Sales,
                       fill = Genre)) +
  geom_bar(stat = "identity", position="dodge") +
  ggtitle("Volume de Vendas Globais \npor genero para PS3, PS4")+
  xlab("Plataforma")+
  ylab("Valor de venda")+
  scale_fill_discrete(name="Genero")


p <- tb_game_sales %>%
  filter(Platform %in% c("PS3", "PS4"),
         Genre %in% c("Action","Racing")) %>%
  ggplot(mapping = aes(x = Platform,
                       y = Global_Sales,
                       fill = Genre)) +
  geom_bar(stat = "identity", position="dodge") +
  ggtitle("Volume de Vendas Globais \npor genero para PS3, PS4")+
  xlab("Plataforma")+
  ylab("Valor de venda")+
  scale_fill_manual(name="Genero",
                    values=c("gray", "lightblue"),
                    labels=c("Ação", "Corrida")) +
  theme_bw() +
  theme(plot.title = element_text(hjust=0.5))

library(plotly)

ggplotly(p)

ggplotly(p2)

library(geobr)

geo_ufs <- geobr::read_state(code_state = 'all', year = 2018)

head(geo_ufs)

ggplot(geo_ufs) +
  geom_sf(aes(geometry = geom,
              fill = as.character(code_region)))
