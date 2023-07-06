#include <iostream> // Importação de biblioteca para uso de entrada e saída de dados.

void valor(int k, int &Fk, int &Gk) // Declara função valor, que recebe como parâmetros o inteiro k, e os ponteiros de inteiro Fk e Gk
{
    if (k == 1) // Verifica se k = 1 é verdadeiro, se for associa os valores 2 e 1 para as variáveis Fk e Gk respectivamente
    {
        Fk = 2;
        Gk = 1;
        return;
    }

    if (k == 2) // Verifica se k = 2 é verdadeiro, se for associa os valores 1 e 2 para as variáveis Fk e Gk respectivamente.
    {
        Fk = 1;
        Gk = 2;
        return;
    }

    int Fi_menos_1 = 1, Fi_menos_2 = 2;
    int Gi_menos_1 = 2, Gi_menos_2 = 1;

    for (int i = 3; i <= k; i++)
    {
        int Fi = 2 * Fi_menos_1 + Gi_menos_2;
        int Gi = Gi_menos_1 + 3 * Fi_menos_2;

        Fi_menos_2 = Fi_menos_1;
        Fi_menos_1 = Fi;

        Gi_menos_2 = Gi_menos_1;
        Gi_menos_1 = Gi;
    }

    Fk = Fi_menos_1;
    Gk = Gi_menos_1;
}

int main()
{
    int k;

    std::cout << "Digite o valor de k: ";
    std::cin >> k;

    int Fk, Gk;
    valor(k, Fk, Gk);

    std::cout << "F(" << k << ") = " << Fk << std::endl;
    std::cout << "G(" << k << ") = "<< Gk << std::endl;

    return 0;
}
