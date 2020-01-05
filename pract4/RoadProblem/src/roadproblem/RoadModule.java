package roadproblem;

import org.opt4j.core.problem.ProblemModule;

public class RoadModule extends ProblemModule 
{

	@Override
	protected void config() 
	{
		// mostrará errores mientras ProyectoCreator, ProyectoDecoder y ProyectoEvaluator no estén completos
		bindProblem(RoadCreator.class, RoadDecoder.class, RoadEvaluator.class);
	}

}

