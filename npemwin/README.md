# npemwin

## Upstream Source

[http://www.noaaport.net/projects/emwin.html](http://www.noaaport.net/projects/emwin.html)

## Upstream Description

Npemwin

Npemwin is a separate program, that can used stand-alone or in conjuction with an Nbsp server. Npemwin can connect to a list of EMWIN servers, or to a NOAAPort Nbsp server or to a directly attached serial (WX12/13) device. It saves all the files received in a directory based on file type and WFO ID. Extensive facilities allow to call a script for each complete file received for post-processing (alarms/notifications, database insertion, and others). It can in turn serve any number of byte blaster clients, including of course other instances of Npemwin itself, and it can relay the data by ldm and nntp.

Byteblaster Npemwin

Npemwin can be used independently of nbsp. In that mode, it can connect to any number of byte blaster servers or to a directly attached emwin serial (WX12/13) device. In any case, it will serve the data to any number of byte blaster clients, including other instances of npemwin itself, and it can relay the data by ldm and nntp.

It can be configured to register itself with the NWS master host to be advertised as a "public" server and appear in the list of available servers. It has no hard-coded limits to the number of clients it can serve. The number can be limited in the run-time configuration file if desired. Clients can be dennied or allow access through the tcpwrappers /etc/hosts.allow file. When used in this way npemwin tries to imitate ``bug for bug'' the behaviour of a regular BB server, as seen by either the BB clients, the BB servers or the master host.

The following are some of the more important features.

* Npemwin can be used as a client to Nbsp (The NOAAPort Broadcast System Processor).
* It can also get the data from any number of byte blaster servers, which is the default configuration when it is installed by an rpm or bsd package.
* It can also be configured to injest from an emwin serial device.
* It can register itself with the NWS master host as a "public" BB server.
* Npemwin can serve any number byteblaster clients. There is no hard-coded limit.
* It has a built-in web server (based on tclhttpd).
* It can send every file received to an nntp "news" server such as inn for distribution by nntp. The server 1.nntp.inoaaport.net is open to nntp (news) clients.
* It can send the files to an ldm server for further distribution or for saving the files in a directory structure such that they can be used with Gempak. Npemwin to be used as a backup to a Noaaport system.
* It stores all the files received in a directory and file format compatible with many windows programs, in particular Digital Atmosphere, IDV and GrLevel. The filter is enabled by default and no further configuration is required.
* Metar data files are processed to produce text reports, which are readily accessible from the web interface of the built-in web server. A facility is provided to define groups of stations ("collectives") as a set with a unique name to track the observations from that group as one unit. There is direct support for the MetarWeather program for Windows. The data from each station or collective is summarized in a directory which can be exported via samba and the data files are immediately accessible to the MetarWeather program. The metar observations data is displayed in graphical form in the web interface. Plots are generated for the temperature, dew point, relative humidity, pressure and wind speed for any station.
* The latest copy of every file received is saved in a separate "data/latest" subdirectory, index by file type and WFO.
* It is scriptable. For each file received, a script (or any program) or actually any number of them, will be invoked to process the files received. The built-in facility can even be bypassed altogether and replaced by your own.
* It keeps a complete inventory of every file received by the minute for the last 24 hours.
* Npemwin can be set to drop privileges and run as an ordinary user.
* A user-configurable scheduler, which runs every minute, can be used to execute any program either regularly or at specified times.
* Works "out of the box".

## Platforms

armv7, arm64, amd64
