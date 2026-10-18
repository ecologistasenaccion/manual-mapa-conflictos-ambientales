# Manual de uso del Mapa de Conflictos Ambientales
# ------------------------------------------------
# Uso:  make web | make pdf | make todo | make ver | make limpiar

.PHONY: todo web pdf ver limpiar enlaces

todo: ## Genera la web y el PDF
	quarto render

web: ## Genera solo la version HTML (carpeta _book/)
	quarto render --to html

pdf: ## Genera solo el PDF
	quarto render --to pdf

ver: ## Previsualiza con recarga automatica
	quarto preview

limpiar: ## Borra los ficheros generados
	rm -rf docs .quarto

enlaces: ## Comprueba los enlaces internos al renderizar
	quarto render --to html 2>&1 | grep -i "unable to resolve" || echo "Enlaces correctos"
