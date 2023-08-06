pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template NikhilCircuit () {  
    // Signal inputs
    signal input a;
    signal input b;

    // Signal from gates
    signal x;
    signal y;

    // Final signal output
    signal output Q;

    // Component gates used to create the assessment circuit
    component andGate = AND();
    component notGate = NOT();
    component orGate = OR();

    // Circuit logic
    andGate.a <== a;
    andGate.b <== b;
    x <== andGate.out;

    notGate.in <== b;
    y <== notGate.out;

    orGate.a <== x;
    orGate.b <== y;
    Q <== orGate.out;
}

    template AND() {
        signal input a;
        signal input b;
        signal output out;

        out <== a*b;
    }
    template NOT() {
        signal input in;
        signal output out;

        out <== 1 + in - 2*in;
    }
    template OR() {
        signal input a;
        signal input b;
        signal output out;

        out <== a + b - a*b;
    }

component main = NikhilCircuit();