namespace QuantumProject {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Arrays;

    operation Q4(qbit1: Qubit, qbit2: Qubit): Unit {
      H(qbit1);
      CNOT(qbit1,qbit2);
	}

    @EntryPoint()
    operation Test() : Unit {
        let count = 2;
        use qbits = Qubit[count];
        Q4(qbits[0], qbits[1]);
        DumpMachine();
        for qbit in qbits{
            if (M(qbit) != Zero){
                X(qbit);
            }
        }
    }
}

// به طور کلی یک استیت در هم تنیده است اگر نتوان ان را به صورت ضرب تانسوری در اورد و در نتیجه برای مثال اگر یکی را اندازه بگیریم چه صفر و چه یک پس در نتیجه بفیه کولپس می شوند
// در این مثال نیز ابتدا گیت هدمارت را روی کیوبیت اول پیاده کردیم و سپس کنترل نات را بر روی کیبیت دوم به شرط یک بودن کیوبیت اول فراخوانی کردیم تا دو تا کیوبیت در هم تنیده شوند 
