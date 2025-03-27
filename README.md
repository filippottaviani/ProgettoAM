# LiDAR SLAM

Questo repository contiene il progetto relativo all'esame di Autonomous Robotics, sviluppato da Filippo Ottaviani in collaborazione con Samuele Ceccarelli.

## Descrizione

Il progetto implementa un sistema di Simultaneous Localization and Mapping (SLAM) utilizzando dati LiDAR attraverso la simulazione in Simulink di un veicolo che si muove in una scena 3D. In particolare si vuole permettere all'utente di scegliere una traiettoria sulla mappa, simulare un veicolo che la segue ed estrarre le misure dal sensore LiDAR posizionato sopra di esso. Una volta ottenuti ed elaborati opportunamente i dati, si desidera implementare un algoritmo di SLAM che permetta di ottenere una ricostruzione della mappa dell'ambiente e una stima della traiettoria. Queste verranno poi confrontate con il riferimento reale (ground truth) per verificare la bontà dell'algoritmo. 

## Struttura del Repository

- `animations/`: Contiene animazioni e visualizzazioni generate durante l'elaborazione dei dati.
- `functions/`: Include funzioni MATLAB personalizzate utilizzate nel progetto.
- `CustomLidarSLAM.slx`: Modello Simulink principale per l'implementazione del sistema SLAM.
- `lidar_slam_project.mlx`: Script MATLAB Live che documenta e guida attraverso le varie fasi del progetto.

## Requisiti per l'uso

- MATLAB con licenza per l'uso di Simulink.
- Toolbox aggiuntivi richiesti:
  - Robotics System Toolbox
  - Navigation Toolbox
  - Lidar Toolbox