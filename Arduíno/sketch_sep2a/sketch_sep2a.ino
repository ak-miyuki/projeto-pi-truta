const int PINO_SENSOR_TEMPERATURA = A0; // declaração de variável
float temperaturaCelsius; // declaração de variável
float temperaturaIdeal

void setup() {
  Serial.begin(9600); 
}

void loop() {
  int valorLeitura = analogRead(PINO_SENSOR_TEMPERATURA);
  temperaturaCelsius = ((valorLeitura * 5.0 / 1023.0) / 0.01;
  temperaturaIdeal = temperaturaCelisus - 5;

  Serial.print("Temperatura: ");
  Serial.print(temperaturaIdeal);
  Serial.println(" ºC");

  delay(2000);
}
