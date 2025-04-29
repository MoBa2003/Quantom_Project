namespace QuantumProject {
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Arrays;

    operation Q6(SampleFunction : ((Qubit[]) => ()), n: Int) : Bool {
        use myqbits = Qubit[n + 1];
        X(myqbits[n]);
        for q in myqbits {
            H(q);
        }
        SampleFunction(myqbits);
        for i in 0 .. n - 1 {
            H(myqbits[i]);
        }

        mutable isConstant = true;
        for i in 0 .. n - 1 {
            if (M(myqbits[i]) != Zero) {
                set isConstant = false;
            }
        }

        for q in myqbits {
            if (M(q) != Zero) {
                X(q);
            }
        }

        return isConstant;
    }

    @EntryPoint()
    operation Test() : Unit {
        let count = 3;
        
        // Define a sample balanced function as the oracle
        // let sampleFunction1 = (qbits) => {
        //     H(qbits[0]);
        //     CNOT(qbits[1], qbits[0]);
        //     H(qbits[0]);
        // };
        //   let funcition = sampleFunction1;

        // Define a sample constant function as the oracle
         let sampleFunction2 = (qbits) => ();
         let funcition = sampleFunction2; // Change to sampleFunction2 to test a constant function
      
       
        let result = Q6(funcition, count);
        if(result){
            Message("the function is constant");
        }
        else{
            Message("the function is balanced");
        }
        DumpMachine();
    }
}

//بخاطر حل مسیله کمی چینش تابع تست را تغییر دادم ولی منطق اصلی مسیله پابرجاست