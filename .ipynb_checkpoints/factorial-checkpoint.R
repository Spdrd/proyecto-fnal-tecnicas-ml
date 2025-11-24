library(psych)

# Prueba Bartlett: Hay o no corr entre las variables
# H0: Vars no correlacionadas
# H1: Algunas correlacionadas
cortest.bartlett(diseases)

# ÍNDICE KMO:
# Mide que si las correlaciones son los suficientemente 
# fuertes y útiles para extraer factores
# Correlaciones Parciales vs Correlaciones Simples
# Si las correlaciones parciales son chiquitas, tienen varianza común y eso sirve
# para el análisis factorial, si son grandes signfica que están "contaminadas" por
# el resto y no se puede hacer análisis factorial

# 0.75 < KMO -> BIEN
# 0.5 <= KMO -> ACEPTABLE
# 0.5 > KMO -> INACEPTABLE
KMO(carros)

# Hallo la corr. entre las variables y me quedo cuando llegue a 1
carros_cor=cor(carros)
scree(carros_cor, pc=FALSE)

# func. para hacer AF
# parametros: r=correlaciones, nfactors=numero de factores
# fm=metodo_factor, puede ser:
# pa-> comunalidades, ml -> maxima verosimilitud
# rotate=rotacion, puede ser varimax, cuartimax
fa_carros <- fa(r=carros_cor, 
                nfactors = 2, fm="pa", 
                max.iter=100, 
                rotate="varimax")

# PAn: son los factores y como se correlacionan las variables con los factores
# SS loadings: varianza explicada en cantidad de variables, max. loadings = num. variables
# Proportion Var: me dice la prop. varianza acumulada en términos porcentuales
print(fa_carros)

#Este diagrama me muestra que variables se relacionan con que factores
fa.diagram(fa_carros)