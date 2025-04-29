namespace QuantumProject {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Arrays;

    operation Q2( qs : Qubit[] ) : Unit {
      let n = Length(qs);
        H(qs[0]); 
        for i in 1 .. (n - 1) {
            Controlled X([qs[0]], qs[i]); 
        }
    }

    @EntryPoint()
    operation Test() : Unit {
        let count = 6;
        use qbits = Qubit[count];
        Q2(qbits);
        DumpMachine();
        for qbit in qbits{
            if (M(qbit) != Zero){
                X(qbit);
            }
        }
    }
}