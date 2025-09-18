// Código Baby LM35 - SENSOR DE TEMPERATURA

const int PINO_SENSOR_TEMPERATURA = A3; // Dados recebidos do pino A0 (A zero do Arduíno UNO) = CONST INT (número inteiro e constante = não pode mudar durante a execução do programa)
float temperaturaCelsius; // Dados da variável temperaturaCelsius vai ser do tipo FLOAT (número com casa decimal)
float temperaturaIdeal;
const int temperaturaCelsiusMin = 10;
const int temperaturaCelsiusMax = 20; 

void setup() {
  Serial.begin(9600);
}

void loop() {
  int valorLeitura = analogRead(PINO_SENSOR_TEMPERATURA); // Recebe dados do sensor pelo pino analógico
  temperaturaCelsius = ((valorLeitura * 3.5 / 1023.0) / 0.01); // Transforma od dados obtidos em Celsius 
  temperaturaIdeal = temperaturaCelsius; 

  //Serial.print("Temperatura: "); // Print: 'Temperatura: dado C'
  Serial.print("Temperatura Ideal:");           
  Serial.print(temperaturaIdeal);
  Serial.print(" ");
  Serial.print("Temperatura Minima:");
  Serial.print(temperaturaCelsiusMin);
  Serial.print(" ");
  Serial.print("Temperatura Máxima:");
  Serial.println(temperaturaCelsiusMax);
  //Serial.println(" °C"); 

  delay(2000); // Intervalo entre coleta de dados (2000 milésimos de segundos)
}

