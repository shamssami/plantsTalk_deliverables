from firebase import firebase
import serial
import time

url = 'https://plant-disease-detection-fbfee-default-rtdb.firebaseio.com'
firebase = firebase.FirebaseApplication(url, None)

#Connect to Serial Port for communication
ser = serial.Serial('COM3', 9600, timeout=0)

#Setup a loop to send Temperature values at fixed intervals
#in seconds
fixed_interval = 10
while 1:
  try:
        if ser.in_waiting > 0:
            time_hhmmss = time.strftime('%H:%M:%S')
            date_mmddyyyy = time.strftime('%d/%m/%Y')

            data = ser.readline()
            decode_data = data.decode('utf-8').strip('\r\n')
            datasplit = decode_data.split(',')
            temperature = datasplit[0].strip('<')
            humidity = datasplit[1].strip(',')
            moisture = datasplit[2].strip('>')

            print('temp == '+temperature)
            print('humidity == '+humidity)      
            print('moisture == '+moisture)      
           #insert record
            data_temp = {'date':date_mmddyyyy,'time':time_hhmmss,'value':temperature}
            data_humidity = {'date':date_mmddyyyy,'time':time_hhmmss,'value':humidity}
            data_moisture = {'date':date_mmddyyyy,'time':time_hhmmss,'value':moisture}

            result1 = firebase.post('/temp/',data_temp)
            result2 = firebase.post('/humidity/',data_humidity)
            result3 = firebase.post('/moisture/',data_moisture)

            # result = requests.post(firebase_url + '/plant-disease-detection-fbfee-default-rtdb/temp',data)
            print(result1)
            print(result2)
            print(result3)



    # #temperature value obtained from Arduino + LM35 Temp Sensor          
    # temperature_c = ser.readline()[:-2].decode("utf-8")
    # print(temperature_c)

    # if temperature_c != "":
    #     #current time and date

        
    #     #current location name
    #     temperature_location = 'Bethlehem'
        
    #     #insert record
    #     data = {'date':date_mmddyyyy,'time':time_hhmmss,'value':temperature_c}
    #     result = firebase.post('/temp/',data)
    #     # result = requests.post(firebase_url + '/plant-disease-detection-fbfee-default-rtdb/temp',data)
    #     print(result)
    #     time.sleep(fixed_interval)
    # else:
    #     print('The temperature_c is null.......')    
  except IOError:
    print('Error! Something went wrong.')
  time.sleep(fixed_interval)

