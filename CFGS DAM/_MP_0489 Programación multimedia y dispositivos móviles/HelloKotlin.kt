class HelloKotlin {
    // property (data member)
    //    private var isOn: Boolean = false

    // Kotlin is data type inference; it dosn't need declare data da types like Java
    public fun dataTypes() {

        // string
        // val string: String = "hello kotlin" <-- redunant data type definition
        val greet = "hello kotlin!"
        val inquire = "how are you?"
        println(greet + "\n" + inquire)

        // numbers
        // real numbers and float numbers <-- works together 100%
        val salary = 21
        val hours = 24
        val iva = 0.21
        val ammount = (salary * hours) * iva
        println(ammount)

        // booleans
        val isRunning = true
        val isListenning = false
        println(isRunning == isListenning) 

    } 
}

fun main(args : Array<String>) {
    val a = HelloKotlin();
    a.dataTypes()
}