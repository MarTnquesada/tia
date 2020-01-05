package roadproblem;
import java.util.ArrayList;
import org.opt4j.core.genotype.IntegerGenotype;
import org.opt4j.core.problem.Decoder;

public class RoadDecoder implements Decoder<IntegerGenotype, ArrayList<Integer>>{
	@Override
	public ArrayList<Integer> decode(IntegerGenotype genotype){
		ArrayList<Integer> fenotype = new ArrayList<Integer>();
		//We copy the genotype values into the collection
		for (int id = 0; id < genotype.size(); ++id) {
			fenotype.add(genotype.get(id));
		}
		return fenotype;
	}
}
