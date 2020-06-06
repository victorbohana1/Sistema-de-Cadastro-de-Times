import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import '../model/time.dart';

@Component(
  selector: 'app-times',
  templateUrl: 'app_times_component.html',
  directives: [coreDirectives, formDirectives],
)

class AppTimesComponent{
  
  final List times = [];
  var maisVelho = Time();
  
  void adicionarTime(nome, estado, ano){
    if(estado != '' && int.parse(ano) > 0 && nome != '') {
      var novoTime = Time(nome: nome, estado: estado, ano: int.parse(ano));
      times.add(novoTime);
    }
    maisVelho = acharMenorAno(times);
  }

  Time acharMenorAno(List times){
    List listaDeAnos = [];
    for (var time in times) {
      listaDeAnos.add(time.ano);
    }
    listaDeAnos.sort();
    int ano = listaDeAnos[0];
    
    var timeMaisVelho = Time();
    for(var time in times) {
      if(time.ano == ano){
        timeMaisVelho = time;
      }
    }
    return timeMaisVelho;
  }

  void removerTime(int index){
    times.removeAt(index);
    maisVelho = acharMenorAno(times);
  }
}