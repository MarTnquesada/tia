package roadproblem;
import java.util.ArrayList;
import org.opt4j.core.Objectives;
import org.opt4j.core.problem.Evaluator;
import org.opt4j.core.Objective.Sign;

public class RoadEvaluator  implements Evaluator<ArrayList<Integer>>{
	@Override
	public Objectives evaluate(ArrayList<Integer> fenotype) {
		int cost = 0;
		int productivity = 0;
		//stores how many wforces are assigned to each turn
		int turnwforces[] = new int[3];
		for(int id = 0; id < fenotype.size(); ++id) {
			//get the values that represent this fenotype decoding it from the matrices in Data
			turnwforces[fenotype.get(id) - 1] += 1;
			cost += Datos.matrizCostes[id][fenotype.get(id) - 1];
			productivity += Datos.matrizProductividad[id][fenotype.get(id) - 1];
		}
		//restriction: there has to be at least 3 wforces per turn
		for(int i = 0; i < turnwforces.length; ++i) {
			if(turnwforces[i] < 3){
				cost = Integer.MAX_VALUE;
				productivity = Integer.MIN_VALUE;
				break;
			}
		}
		Objectives objectives = new Objectives();
		//if we are taking into consideration both cost and productivity, add 2 objectives
		objectives.add("Coste-MIN", Sign.MIN, cost);
		objectives.add("Productividad-MAX", Sign.MAX, productivity);
		return objectives;
	}

}
