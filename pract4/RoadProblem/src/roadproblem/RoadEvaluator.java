package roadproblem;
import java.util.ArrayList;
import org.opt4j.core.Objectives;
import org.opt4j.core.problem.Evaluator;

public class RoadEvaluator  implements Evaluator<ArrayList<Integer>>{
	@Override
	public Objectives evaluate(ArrayList<Integer> fenotype) {
		double result = 0.0;
		for(int id = 0; id < fenotype.size(); ++id) {
			//get the values that represent this fenotype decoding it from the matrices in Data
		}
		Objectives objectives = new Objectives();
		//if we are taking into consideration both cost and productivity, add 2 objectives
		// Mirar ejemplo2 boletín
		//objectives.add(...);
		//objectives.add();
		return objectives;
	}

}
