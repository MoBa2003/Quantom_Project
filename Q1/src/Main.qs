namespace QuantumProject {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Arrays;
    operation Q1( qbits : Qubit[] ) : Unit{
      for  qbit in qbits{
       H(qbit);
      }
    }
    @EntryPoint()
    operation Test() : Unit {
        let count = 2;
        use qbits = Qubit[count];
        Q1(qbits);
        DumpMachine();
        for qbit in qbits{
            if (M(qbit) != Zero){
                X(qbit);
            }
        }
        
    }
}