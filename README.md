# FaceTo Mini
A small but interesting puzzle game project written in Flutter.

> The application is available for download in several stores:
> - Google Play: [FaceTo Mini](https://play.google.com/store/apps/details?id=com.faceto.mini.facetomini&hl=ru), [FaceTo Pro](https://play.google.com/store/apps/details?id=com.faceto.app.faceto&hl=ru).
> - AppGallery: [FaceTo Mini](https://appgallery.huawei.com/app/C104966675), [FaceTo Pro](https://appgallery.huawei.com/app/C104966641).
> - RuStore: [FaceTo Mini](https://apps.rustore.ru/app/com.faceto.mini.facetomini.huawei).

## Description


Welcome developer. 
Here you will find the implementation of my personal project of creating a puzzle game.

To test the puzzle idea, a puzzle engine was first developed to determine how the puzzle would twist and fold, and then a small application was written around the engine. For a more detailed description of how the puzzle works, see the article on [Habr](https://habr.com/ru/articles/598995/).</br> 
The application is written using the `clean architecture` pattern. In order to store all `DI` in one file I use service locator [GetIt](https://pub.dev/packages/get_it). The [Provider](https://pub.dev/packages/provider)  state manager is used to update the interface. 

The content is a series of prepared images, each of which is a separate scene of the launch of the puzzle. The presented Mini version uses only images from the device. The [Pro](https://play.google.com/store/apps/details?id=com.faceto.app.faceto&hl=ru) version of the application uses images obtained from the Internet or stored on the device. This version also remembers the player's statistics to compare their puzzle solving performance with other players.

## Development tools
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![PHP](https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white)
![MySQLi](https://img.shields.io/badge/MySQL-00000F?style=for-the-badge&logo=mysql&logoColor=white)


## Platforms

The project was developed for playing on mobile platforms, but for a more convenient launch and testing, I tried to keep support for Web and Desktop. Cross-platform support forced us to abandon the use of the audio player, due to an existing bug with [@staticInterop](https://github.com/KubrickRubrik/facetomini/issues/16), so the sound setting in the application is not active yet.


## Used packages and plugins

Previously, when developing mobile applications, I used [SqFlite](https://pub.dev/packages/sqflite) for working with an SQL database or [Isar](https://pub.dev/packages/isar) for working with a non-SQL database on different platforms. On this project, I decided to try [Drift](https://pub.dev/packages/flutter_secure_storage) to get the flexibility and convenience of the two previous approaches.

<table>
<tr>
 <th>Purpose</th> <th>Source</th> <th>Purpose</th> <th>Source</th>
</tr>
 <tr>
    <td>Localization (en,ru)</td>         <td><a href='https://pub.dev/packages/device_preview'>device_preview</a></td>
    <td>Request permissions</td>          <td><a href='https://pub.dev/packages/sqlite3_flutter_libs'>permission_handler</a></td>
 </tr> 
 <tr>
   <td>Localization (en,ru)</td>         <td><a href='https://pub.dev/packages/device_preview'>device_preview</a></td>
   <td>Request permissions</td>          <td><a href='https://pub.dev/packages/sqlite3_flutter_libs'>permission_handler</a></td>
 </tr> 
 <tr> 
   <td>State manager</td>                <td><a href='https://pub.dev/packages/provider'>provider</a>     </td>
   <td>Service Locator</td>              <td><a href='https://pub.dev/packages/get_it'>get_it</a>     </td>
 </tr> 
 <tr>
   <td>Launching a URL</td>              <td><a href='https://pub.dev/packages/url_launcher'>url_launcher</a>     </td>
   <td>Navigation</td>                   <td><a href='https://pub.dev/packages/go_router'>go_router</a>     </td>
 </tr> 
  <tr> 
   <td>Networking</td>                   <td><a href='https://pub.dev/packages/dio'>dio</a>    </td>
   <td>Data store </td>                  <td><a href='https://pub.dev/packages/flutter_secure_storage'>drift</a>     </td>
</tr> 
<tr>
   <td>Discover connectivity </td>       <td><a href='https://pub.dev/packages/connectivity_plus'>connectivity_plus</a>     </td>
   <td>File system usage  </td>          <td><a href='https://pub.dev/packages/path_provider'>path_provider</a></td>
</tr> 
<tr> 
   <td>Charts</td>                       <td><a href='https://pub.dev/packages/fl_chart'>fl_chart</a></td>
   <td>Manipulating paths  </td>         <td><a href='https://pub.dev/packages/path'>path</a></td>
</tr> 
 <tr> 
   <td>Playing audio files </td>         <td><a href='https://pub.dev/packages/audio_in_app](https://pub.dev/packages/audioplayers'>audioplayers</a></td>
   <td>Assembly module with sqlite3</td> <td><a href='https://pub.dev/packages/sqlite3_flutter_libs'>sqlite3_flutter_libs</a></td>
</tr> 
<tr> 
   <td>Screen layout check  </td>        <td><a href='https://pub.dev/packages/device_preview'>device_preview</a></td> 
   <td></td>                             <td></td> 
</tr> 
</table>
