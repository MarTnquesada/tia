package roadproblem;
import org.opt4j.core.genotype.IntegerGenotype;
import org.opt4j.core.problem.Creator;
import java.util.Random;

public class RoadCreator implements Creator<IntegerGenotype>{
	public IntegerGenotype create() {
		// the genotype is made up of 10 genes, one for workforce. 
		// each gene is assigned to turn 1, 2 or 3
		IntegerGenotype genotype = new IntegerGenotype(1, Datos.NUM_TURNOS);
		genotype.init(new Random(), Datos.NUM_CUADRILLAS);
		return genotype;
	}
}

