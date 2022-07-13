
val current = LocalDateTime.now()

val formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS")
val formatted = current.format(formatter)

println("Hellow World, current time: ${formatted}")
