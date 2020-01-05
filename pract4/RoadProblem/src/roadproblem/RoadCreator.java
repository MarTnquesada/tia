package roadproblem;
import org.opt4j.core.genotype.IntegerGenotype;
import org.opt4j.core.problem.Creator;
import java.util.Random;

public class RoadCreator implements Creator<IntegerGenotype>{
	public IntegerGenotype create() {
		IntegerGenotype genotype = new IntegerGenotype(1, Datos.NUM_CUADRILLAS);
		genotype.init(new Random(), Datos.NUM_CUADRILLAS);
		return genotype;
	}
}

