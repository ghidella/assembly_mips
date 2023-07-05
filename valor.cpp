#include <iostream>

void valor(int x, int& Fx, int& Gx) {
    if (x == 1) {
        Fx = 2;
        Gx = 1;
        return;
    }

    if (x == 2) {
        Fx = 1;
        Gx = 2;
        return;
    }

    int Fi_minus_1 = 1, Fi_minus_2 = 2;
    int Gi_minus_1 = 2, Gi_minus_2 = 1;

    for (int i = 3; i <= x; i++) {
        int Fi = 2 * Fi_minus_1 + Gi_minus_2;
        int Gi = Gi_minus_1 + 3 * Fi_minus_2;

        Fi_minus_2 = Fi_minus_1;
        Fi_minus_1 = Fi;

        Gi_minus_2 = Gi_minus_1;
        Gi_minus_1 = Gi;
    }

    Fx = Fi_minus_1;
    Gx = Gi_minus_1;
}

int main() {
    int x;

    std::cout << "Digite o valor de x: ";
    std::cin >> x;

    int Fx, Gx;
    valor(x, Fx, Gx);

    std::cout << "Fx = " << Fx << std::endl;
    std::cout << "Gx = " << Gx << std::endl;

    return 0;
}
