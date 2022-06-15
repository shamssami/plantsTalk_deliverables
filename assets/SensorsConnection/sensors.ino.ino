// First we include the libraries
#include <OneWire.h> 
#include <DallasTemperature.h>
#include <DHT.h>

//DHT HUMIDTY&TEMP


//Constants
#define DHTPIN 7     // what pin we're connected to
#define DHTTYPE DHT22   // DHT 22  (AM2302)
DHT dht(DHTPIN, DHTTYPE); //// Initialize DHT sensor for normal 16mhz Arduino


//Variables
int chk;
float hum;  //Stores humidity value
float temp; //Stores temperature value


//MOISNTURE sensor variables
const int AirValue = 620;   //you need to replace this value with Value_1
const int WaterValue = 310;  //you need to replace this value with Value_2
int soilMoistureValue = 0;
int soilmoisturepercent=0;
int soilmoistureLow=0;
int soilmoistureHigh=100;

// Data wire for thermal sensor  pin 2 on the Arduino 
#define ONE_WIRE_BUS 2 

// Setup a oneWire instance to communicate with any OneWire devices  
// (not just Maxim/Dallas temperature ICs) 
OneWire oneWire(ONE_WIRE_BUS); 

// Pass our oneWire reference to Dallas Temperature. 
DallasTemperature sensors(&oneWire);
/********************************************************************/ 
void setup(void) 
{     
 // start serial port 
 Serial.begin(9600); 
 
 // Start up the library 
 sensors.begin(); 

  dht.begin();
} 
void loop(void) 
{ 
//*******************DHT READINGS
   delay(2000);
    //Read data and store it to variables hum and temp
    hum = dht.readHumidity();
    temp= dht.readTemperature();
    //Print temp and humidity values to serial monitor
    Serial.print("<");
    Serial.print(hum);
    Serial.print(",");
    Serial.print(temp);


//************************ MOSITURE
soilMoistureValue = analogRead(A0);  //put Sensor insert into soil
soilmoisturepercent = map(soilMoistureValue, AirValue, WaterValue, 0, 100);
if(soilmoisturepercent >= 100)
{
  Serial.print(",");

  Serial.println(soilmoistureHigh);
}
else if(soilmoisturepercent <=0)
{
  Serial.print(",");

  Serial.println(soilmoistureLow);
}
else if(soilmoisturepercent >0 && soilmoisturepercent < 100)
{
  Serial.print(",");
  Serial.print(soilmoisturepercent);
  
}  
Serial.println(">");

  delay(1000);
  
  //**************************************THERMAL
 // call sensors.requestTemperatures() to issue a global temperature 
 // request to all devices on the bus 
/********************************************************************/
// 
// sensors.requestTemperatures(); // Send the command to get temperature readings 
//
///********************************************************************/
// Serial.print("THERMAL Temperature is: "); 
// Serial.print(sensors.getTempCByIndex(0)); // Why "byIndex"?  
//   // You can have more than one DS18B20 on the same bus.  
//   // 0 refers to the first IC on the wire 
//   delay(1000); 
//    Serial.println("");
//



   
} 
