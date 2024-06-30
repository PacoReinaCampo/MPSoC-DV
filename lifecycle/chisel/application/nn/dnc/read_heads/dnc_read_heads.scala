import chisel3._

class HelloWorld extends Module {
  val io = IO(new Bundle {
    val out = Output(UInt(8.W))
  })

  io.out := "helloworld".U
}

object HelloWorld extends App {
  chisel3.Driver.execute(args, () => new HelloWorld)
}
