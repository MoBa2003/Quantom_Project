namespace QuantumProject {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Arrays;
    operation Q3(qs: Qubit[], bits: Bool[]): () { 
       let n = Length(qs);
        H(qs[0]); 
        for i in 1 .. (n - 1) {
            if (bits[i]){
            Controlled X([qs[0]], qs[i]); 
        }
        }
	}

    @EntryPoint()
    operation Test() : Unit {
        let count = 5;
        use qbits = Qubit[count];
        mutable bitString = [true, false, true, true, false];
        Q3(qbits, bitString);
        DumpMachine();
        for qbit in qbits{
            if (M(qbit) != Zero){
                X(qbit);
            }
        }
    }
}