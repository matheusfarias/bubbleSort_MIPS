/*
# Algoritmo:
#		Imprime mensagem inicial
#		mostra_vetor()
#		trocou = true
#		limite = n-1
#		while (limite > 0) AND (trocou)
#			trocou = false
#			for (i = 0 ; i < limite ; i++)
#				if vetor[i] > vetor[i+1]
#					troca(&vetor[i], &vetor[i+1]) // Troca elementos vetor[i] e vetor[i+1]
#					trocou = true
#			mostra_vetor()
#			limite--


*/


#include <stdio.h>
#define TRUE 1
#define FALSE 0

void mostra_vetor(int n, int v []) {
	int i;
	for(i = 0; i < n; i++) 
		printf("%d ", v[i]);
	printf("\n");
}

void troca(int* a, int* b) {
	int aux = *a;
	*a = *b;
	*b = aux;
}

void bubbleSort(int n, int v []) {
	int trocou = TRUE;
	int i;
	//mostra_vetor(n, v);
	int limite = n - 1;
	while ((limite > 0) && (trocou) ){
		trocou = FALSE;
		for(i = 0; i < limite; i++) {
			if (v[i] > v[i+1]) {
				troca(&v[i], &v[i+1]);
				trocou = TRUE; 
			}
		}
		//mostra_vetor(n, v);
		limite--;
	}

}



int main() {


	int vetor[] = {9, 1, 10, 2, 9, 6, 13, 15, 13, 0, 12, 5, 6, 0, 5, 7};
	int n = 16;

	bubbleSort(n, vetor);

	mostra_vetor(n, veto);

	return 0;
}