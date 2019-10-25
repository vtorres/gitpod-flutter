# Gitpod Flutter

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/vtorres/gitpod-flutter)

## Setup

### Mobile

###### Check your mobile lan ip and feel free to use your own port configuration

```
  SMARTPHONE_LOCAL_IP = 192.168.0.10 (LAN IP)
  INTERNAL_PORT = 5555
```

###### [Localhost command] Run the following command to switch adb on your device to work over the network using the internal port

```
  adb tcpip INTERNAL_PORT
```

###### [Localhost command] Check adb connection from localhost

```
  adb connect SMARTPHONE_LOCAL_IP:INTERNAL_PORT
```

###### [Localhost command] Starts ngrok tcp forwarding to your mobile or if you prefer you can forward a chosen port on your router to the mobile

- Ngrok describes itself as “expose a local server behind a NAT or firewall to the internet.”, making our lives easier.

```
  ngrok tcp SMARTPHONE_LOCAL_IP:INTERNAL_PORT
```

###### [Gitpod command] Connect from your Gitpod to your localhost for debugging

```
  adb connect NGROK_ADDRESS:NGROK_PORT
  flutter run
```

### Web

- As web support hasn’t yet reached alpha, you can expect to experience crashes and missing features.
- The website URL may be very slow to load on first access.
- It needs to run and kill the server a few times before the Gitpod finds the dynamic port allocation and lets you expose the right port on the Open Ports tab.

```
  flutter run -d web
```
