
library(FactoMineR)

# 1. Generar la componentes principales
#scale.unit -> define si se estandarizan las variables
#ncp -> número de componentes para hacer, se recomienda hacerlo con el número
# de variables y luego bajarla

CP_Ex=PCA(diseases, scale.unit=TRUE, ncp=5, graph=FALSE) 

# 2. Analizar las componentes generadas
library(factoextra)

#var_Ex contiene información como las componentes generadas 
# i.e. los vectores propios
var_Ex=get_pca_var(CP_Ex)

#Esta variable contiene las componentes principales
var_Ex$coord

#los valores propios se pueden obtener con 
# esto me dicde la varianza explicada por cada componente
get_eigenvalue(CP_Ex)

#gráfico de codo para la varianza:
fviz_screeplot(
  CP_Ex,
  choice = "variance",
  addlabels = TRUE,
  geom = "line",
  ylim = c(0, 80),
  xlab = "Dimensiones",
  ylab = "Porcentaje de varianza explicada",
  main = ""
)

# son las correlaciones
var_Ex$cor

#para las contribuciones de cada variable se tiene
var_Ex$contrib



#3. Análisis de Individuos conforme a las componentes

#get_pca_ind obtiene las información por individuo en CP_Ex

ind_Ex=get_pca_ind(CP_Ex)

#las coordenadas de los individuos en los ejes se encuentran en
ind_Ex$coord

#el ángulo con los ejes de cada individuo 
ind_Ex$cos2

#para la contribucióin de cada individuo a los ejes
ind_Ex$contrib

#graficar
fviz_pca_ind(CP_Ex, axes=c(1,2))