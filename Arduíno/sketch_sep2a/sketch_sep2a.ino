const int PINO_SENSOR_TEMPERATURA = A0; // declaração de variável
float temperaturaCelsius;

void setup() {
  Serial.begin(9600); 
}

void loop() {
  int valorLeitura = analogRead(PINO_SENSOR_TEMPERATURA);
  temperaturaCelsius = (valorLeitura * 5.0 / 1023.0) / 0.01;


  Serial.print("Temperatura: ");
  Serial.print(temperaturaCelsius);
  Serial.println(" ºC");

  delay(2000);
}
