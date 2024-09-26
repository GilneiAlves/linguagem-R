library(dplyr)

teste <- data.frame()



for (i in 1:length(tramitacao$tramitacoes)) {
  temp <- as.data.frame(tramitacao$tramitacoes[i]) # Extrai tramitacoes
  temp$Proposicao <- as.character(tramitacao$id[i]) # Seleciona proposicao
  temp$situacaoCidadao <- as.character(tramitacao$situacaoCidadao[i]) # Situacao Cidadao
  temp$emTramitacao <- as.character(tramitacao$emTramitacao[i]) # Em Tramitacao
  
  # Filtra os dados onde bolInterna é false
  temp_filtrado <- temp %>%
    filter(bolInterna == FALSE)
  
  # Verifica se há dados filtrados
  if (nrow(temp_filtrado) > 0) {
    # Seleciona o máximo valor de numOrdem
    max_numOrdem <- max(temp_filtrado$numOrdem)
    
    # Filtra os dados onde numOrdem é igual ao máximo
    temp_final <- temp_filtrado %>%
      filter(numOrdem == max_numOrdem)
    
    # Adiciona os dados finais ao data frame teste
    teste <- bind_rows(teste, temp_final)
  }
}

# Visualiza os dados finais
View(teste)
